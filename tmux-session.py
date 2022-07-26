import argparse
import os
import pathlib

tmuxinator = (os.popen('which tmuxinator').read()).strip()

list = os.popen(f"{tmuxinator} list").readlines()

projects = [line.strip() for line in list[1:]]

# print(projects)

parser = argparse.ArgumentParser()
parser.add_argument('-p', '--path', type=pathlib.Path, required=True, help='Session root path')
parser.add_argument('-n', '--name', type=str, required=False, help='Session Name')
parser.add_argument('-t', '--type', choices=projects, required=True, help='Session project layout')

args = parser.parse_args()

# Get full path
path = args.path.resolve()

# Use name or default to basename of path
name = args.name or path.name
name = name[1:] if name.startswith('.') else name

# print(f"{tmuxinator} start {args.type} {name} {path}")

os.popen(f"{tmuxinator} start {args.type} {name} {path}").read().strip()
