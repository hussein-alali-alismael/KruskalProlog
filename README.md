KruskalProlog
=============

Kruskal's algorithm implemented in Prolog.

Files
- `Kruskal.pl` — Prolog implementation of Kruskal's Minimum Spanning Tree algorithm.
- `examples.pl` — Example graphs and helper predicates for easy testing.
- `test_kruskal.pl` — `plunit` tests for the implementation.
- `LICENSE` — MIT license.
- `USER_MANUAL.md` — How to use the algorithm and run tests.

Usage
1. To run the Prolog code, open SWI-Prolog and consult the file:

   swipl
   ?- ["Kruskal.pl"].

2. Run examples (recommended):

   swipl
   ?- ["examples.pl"].
   ?- example_graph(G), kruskal(G, MST), sum_weights(MST, W).

3. Run automated tests (requires SWI-Prolog):

   swipl
   ?- ["test_kruskal.pl"].
   ?- run_tests.
