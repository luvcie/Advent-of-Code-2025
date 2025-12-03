-module(aoc_2025).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/aoc_2025.gleam").
-export([main/0]).

-file("src/aoc_2025.gleam", 3).
-spec main() -> nil.
main() ->
    playground@helloworld:print_hello().
