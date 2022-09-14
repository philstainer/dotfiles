#!/bin/zsh

echo "Creating symlinks from repo to home directory"

echo -n "Are you want to continue (y/n)?"
read CONT

if [ "$CONT" = "n" ]; then
    echo "Aborting"
    exit 1
fi

HOME_DIR="$HOME"

ARRAY=(
    .config/kitty   # Kitty config
    .config/nvim    # Kitty config
    .config/yabai   # Yabai config for window managagment
    .config/skhd    # Skhdrc config for keyboard navigation
    .local/bin    # Helpers config
    .gitconfig    # Git config
    .zshrc        # Zsh config
    .p10k.zsh
    .aliases
    .exports
    .tmux.conf    # Tmux config
    .spacebarrc   # Status bar for macos
    git-clone-bare-for-worktrees.sh
    .extra
)

function sync() {
    FROM=$1
    TO=$2

    echo PROCESSING $FROM to $TO

    if [ -L ${TO} ] ; then
        if [ -e ${TO} ] ; then
            echo "Good link, skipping"
        else
            echo "Broken link, stopping"
            exit 1
        fi
    elif [ -e ${TO} ] ; then
        echo "Not a link, stopping"
        exit 1
    else

        if [ -d "$TO" ]; then
            echo "is directory $TO"
            mkdir -p $TO
        else
            TO_DIR=$(dirname $TO)
            echo $TO_DIR
            mkdir -p $TO_DIR
        fi

        ln -s $FROM $TO

        echo "Created!"
    fi
}

mkdir -p $HOME_DIR

for ((I = 1; I < $#ARRAY + 1; I++)); do
    VALUE=$ARRAY[$I]
    FROM="$PWD/$VALUE"
    TO="$HOME_DIR/$VALUE"
    sync $FROM $TO
done
