Awesome latex workspace
===

Easy to use watcher + diff latex.

## Watcher

![watcher](example2.png)

Launch `./watcher.sh` and start editing your `report.tex` right away !
Internally the watcher runs the `Makefile` (classic way to compile a latex)

## Git Latex Diff

![diff](example.png)

Uses [git-latex-diff](https://gitlab.com/groups/git-latexdiff) to generate a pdf
with additions and deletions since the last time this command was run. This
command **must** be run after a commit is made **and** after adding the initial
commit to the file `last-commit.sha`.
