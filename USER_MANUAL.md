KruskalProlog — User Manual
===========================

Overview
--------
This document explains how to use `Kruskal.pl`, a Prolog implementation of Kruskal's Minimum Spanning Tree (MST) algorithm. The implementation expects a graph represented as a list of edges; each edge is a triple `[U, V, W]` where `U` and `V` are vertex identifiers (atoms or integers) and `W` is the numeric weight.

Prerequisites
-------------
- SWI-Prolog (recommended) or another Prolog system that supports standard list/term operations and `append/3`, `delete/3`, `sort/2`, `member/2`.

Files in this repository
------------------------
- `Kruskal.pl` — The implementation of the algorithm.
- `examples.pl` — Example graphs and sample queries to try.
- `test_kruskal.pl` — `plunit` tests you can run to verify correctness.
- `README.md` — Quick project overview and instructions.

Loading the code
----------------
Start SWI-Prolog and consult the file:

```prolog
?- ["Kruskal.pl"].
% or with path
?- consult('Kruskal.pl').
```

Basic usage
-----------
The main predicate is `kruskal(Graph, MST)` where `Graph` is a list of edges and `MST` is a list of edges (the resulting minimum spanning forest / tree).

Example:

```prolog
?- Graph = [[a,b,4],[a,h,8],[b,c,8],[b,h,11],[c,d,7],[c,f,4],[c,i,2],[d,e,9],[d,f,14],[e,f,10],[f,g,2],[g,h,1],[g,i,6],[h,i,7]], kruskal(Graph, MST).
```

Expected behaviour:
- `MST` will contain edges forming an acyclic set with minimum total weight connecting vertices.
- The algorithm returns a minimum spanning forest if the input graph is disconnected.

Examples and typical queries
----------------------------
See `examples.pl` for short example graphs and recommended queries, such as:

```prolog
?- example_graph(G), kruskal(G, MST).
?- small_graph(G), kruskal(G, MST), sum_weights(MST, W).
```

Helper predicates (in `examples.pl`)
- `sum_weights(Edges, Sum)` — computes total weight of an edge list.
- `example_graph/1`, `small_graph/1`, `disconnected_graph/1` provide sample graphs for testing.

Testing (with plunit)
----------------------
SWI-Prolog's `plunit` framework is used for tests. To run the tests:

```prolog
?- [test_kruskal].
?- run_tests.
```

Notes, limitations & tips
------------------------
- The implementation uses a simple list-of-components technique to detect cycles. It is easy to read and suitable for small-to-medium graphs, but is not optimized for very large graphs; for large inputs a union-find (disjoint set) structure is recommended.
- Vertex identifiers can be atoms or numbers; keep them consistent.
- Edge list ordering does not matter—the algorithm sorts by weight internally.

Troubleshooting
---------------
- If `kruskal/2` fails or loops, ensure your graph is a proper list of 3-element lists and that weights are numeric.
- If using a different Prolog system and you hit a compatibility issue, try running with SWI-Prolog.

Contact & contribution
----------------------
Create an issue or pull request on GitHub in the `hussein-alali-alismael/KruskalProlog` repository.

License
-------
MIT — see `LICENSE` file for details.
