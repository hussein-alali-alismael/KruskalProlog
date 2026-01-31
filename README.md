KruskalProlog
=============

Kruskal's algorithm implemented in Prolog.

Files
- `Kruskal.pl` — Prolog implementation of Kruskal's Minimum Spanning Tree algorithm.
- `create_repo_and_push.ps1` — helper PowerShell script to initialize a git repo and push to GitHub (uses `gh` CLI if available).
- `LICENSE` — MIT license.

Usage
1. To run the Prolog code, open SWI-Prolog and consult the file:

   swipl
   ?- ["Kruskal.pl"].

2. To create a GitHub repository and push these files (requires Git, optionally `gh`):

   In PowerShell, from this folder:
   .\create_repo_and_push.ps1 -RepoName "KruskalProlog" -GitHubUser "hussein-alali-alismael" -Visibility Public

If you prefer manual steps, see the script for commands to run.
