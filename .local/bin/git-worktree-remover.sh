#!/bin/sh

git worktree list | grep -o "\[.*\]" | sed 's/[][]//g' | gum choose --no-limit | xargs -n 1 git worktree remove
