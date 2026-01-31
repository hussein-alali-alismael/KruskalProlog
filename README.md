KruskalProlog
=============

Kruskal's algorithm implemented in Prolog.

Files
- `Kruskal.pl` — Prolog implementation of Kruskal's Minimum Spanning Tree algorithm.
- `examples.pl` — Example graphs and helper predicates for easy testing.
- `test_kruskal.pl` — `plunit` tests for the implementation.
- `create_repo_and_push.ps1` — helper PowerShell script to initialize a git repo and push to GitHub (uses `gh` CLI if available).
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

4. To create a GitHub repository and push these files (requires Git, optionally `gh`):

   In PowerShell, from this folder:
   .\create_repo_and_push.ps1 -RepoName "KruskalProlog" -GitHubUser "hussein-alali-alismael" -Visibility Public

If you prefer manual steps, see the script for commands to run.

