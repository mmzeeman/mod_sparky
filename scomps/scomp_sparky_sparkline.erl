%% @author MM Zeeman <mmzeeman@xs4all.nl>
%% @copyright 2013 MM Zeeman
%% Date: 2013-01-19
%% @doc Simple interface to create sparky sparklines

%% Copyright 2013 MM Zeeman
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%% 
%%     http://www.apache.org/licenses/LICENSE-2.0
%% 
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(scomp_sparky_sparkline).
-author("Maas-Maarten Zeeman <mmzeeman@xs4all.nl").
-behaviour(gen_scomp).

-export([vary/2, render/3]).

-include("zotonic.hrl").

vary(_Params, _Context) -> 
	default.

% @doc Render the sparcline. 
%
% Possible params:
%   points: A list with numbers
%   preset: The rendering preset to use. Sparky has some default ones.
%      "hilite-last", "hilite-peaks", "gray-area", "zero-bars" and "binary".
%       It is also possible to define your own presets.. See: lib/js/presets
%   label: Optional label to display. Normally the label is displayed after
%       sparkline, except for hilite-peak.
render(Params, _Vars, _Context) ->
	Points = proplists:get_value(points, Params, []),
	Preset = proplists:get_value(preset, Params, "default"),
	DataPoints = string:join([z_convert:to_list(P) || P <- Points], ","),

	Label = case proplists:get_value(label, Params) of 
		undefined -> 
			[];
		L ->
			z_tags:render_tag(<<"label">>, 
				[{<<"class">>, <<"sparkline-label">>}], [L])
	end,

	Spark = z_tags:render_tag(<<"span">>, [
			{<<"class">>, <<"sparkline">>},
			{<<"data-points">>, DataPoints},
			{<<"data-preset">>, Preset}
		],
		[]),
		
	Sparkline = case Preset of
		"hilite-last" -> 
			Last = render_var(lists:last(Points), "sparkline-last"),
			[Spark, Label, Last];
		"hilite-peaks" ->
			First = render_var(lists:nth(1, Points), "sparkline-first"),
			Last = render_var(lists:last(Points), "sparkline-last"),
			Min = render_var(lists:min(Points), "sparkline-min"),
			Max = render_var(lists:max(Points), "sparkline-max"),
			[Label, First, Spark, Last, Min, Max];
		_ ->
			[Spark, Label]
	end,
	{ok, Sparkline}.
		
%% @doc Give a nice representation for the number.
render_var(N, Class) ->
	z_tags:render_tag(<<"var">>, [{<<"class">>, Class}], [z_convert:to_binary(N)]).
