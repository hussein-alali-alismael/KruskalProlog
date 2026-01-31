%kruskal's algorithm for minimum spanning tree
%=============================================
%condition stop when the graph is empty
vertices([], []).
%recersion to store all vertices from the graph without dublicate
vertices([[X,Y,_]|Edges], Vs) :-
    vertices(Edges, Vs0),
    sort([X,Y|Vs0], Vs).
%sort edges in ascending order by weight
sort_edges([], []).
sort_edges([Edge|Tail], Sorted) :-
    sort_edges(Tail, SortedTail),
    insert_edge(Edge, SortedTail, Sorted).
%Insert a single edge into a sorted list
insert_edge(E, [], [E]).
insert_edge([X1,Y1,W1], [[X2,Y2,W2]|T], [[X1,Y1,W1],[X2,Y2,W2]|T]) :-
    W1 =< W2, !. % if current edge  weight is less or equal
insert_edge(E1, [E2|T], [E2|Res]) :-
    insert_edge(E1, T, Res).
% initialize each vertex as separate component
initial_components([], []).
initial_components([V|Vs], [[V]|Rest]) :-
    initial_components(Vs, Rest).

find_comp(X, [Comp|_], Comp) :- member(X, Comp).
find_comp(X, [_|Rest], Comp) :- find_comp(X, Rest, Comp).
% merge two components and remove old ones
merge_comps(C1, C2, Components, [NewComp|Rest]) :-
    append(C1, C2, NewComp),
    delete(Components, C1, Temp),
    delete(Temp, C2, Rest).

%main algorithm
kruskal(Graph, Res) :-
    vertices(Graph, Vs),
    initial_components(Vs, Comps),
    sort_edges(Graph, SortedEdges),
    kruskal_loop(SortedEdges, Comps, [], Res),!.
% main loop to process sorted edges
kruskal_loop([], _, Res, Res).
kruskal_loop([[X,Y,W]|Edges], Comps, Acc, Res) :-
%find component of vertex X & Y
    find_comp(X, Comps, CX),
    find_comp(Y, Comps, CY),
    (   CX \= CY -> % if edges was in different group not found cycle , complete
        merge_comps(CX, CY, Comps, NewComps),
        append(Acc, [[X,Y,W]], NewAcc),
        kruskal_loop(Edges, NewComps, NewAcc, Res)
    ;   % ignore edge which give cycle
        kruskal_loop(Edges, Comps, Acc, Res)
    ).
