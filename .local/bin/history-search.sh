# !/bin/sh

# gum filter < $HISTFILE --height 20 | sed 's/.*;//g' | pbcopy
cat $HISTFILE | gum filter | sed 's/.*;//g' | pbcopy
