% plunit tests for Kruskal.pl

:- begin_tests(kruskal_tests).

:- ensure_loaded('Kruskal.pl').

test(small_graph_mst) :-
    small_graph(G),
    kruskal(G, MST),
    sum_weights(MST, W),
    assertion(W =:= 3). % edges 1 and 2

test(disconnected_graph) :-
    disconnected_graph(G),
    kruskal(G, MST),
    % MST should be same edges (two components)
    assertion(length(MST, 2)).

test(example_graph_total_weight) :-
    example_graph(G),
    kruskal(G, MST),
    sum_weights(MST, W),
    % Known MST weight for this example is 37
    assertion(W =:= 37).

:- end_tests(kruskal_tests).

% Include helpers from examples.pl
:- ensure_loaded('examples.pl').
