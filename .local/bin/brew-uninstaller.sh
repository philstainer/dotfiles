#!/bin/sh

brew list | gum choose --no-limit | xargs brew uninstall
