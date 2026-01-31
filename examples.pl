% Example graphs and helpers for Kruskal.pl

:- ensure_loaded('Kruskal.pl').

% small example graph
small_graph([[a,b,1],[b,c,2],[a,c,3]]).

% example used in examples
example_graph([[a,b,4],[a,h,8],[b,c,8],[b,h,11],[c,d,7],[c,f,4],[c,i,2],[d,e,9],[d,f,14],[e,f,10],[f,g,2],[g,h,1],[g,i,6],[h,i,7]]).

% disconnected graph
disconnected_graph([[a,b,1],[c,d,2]]).

% sum weights of edges
sum_weights(Edges, Sum) :-
    maplist(edge_weight, Edges, Ws),
    sum_list(Ws, Sum).

edge_weight([_,_,W], W).
