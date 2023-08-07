# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Source exports if exists
[[ ! -f ~/.exports ]] || source ~/.exports

plugins=(git gh pip)
plugins+=(npm pnpm)
plugins+=(z zsh-autosuggestions history)

# ZSH_TMUX_AUTOSTART=true
# ZSH_TMUX_AUTOQUIT=true
# ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_FIXTERM=true


[[ ! -f $ZSH/oh-my-zsh.sh ]] || source $ZSH/oh-my-zsh.sh

# 10ms for key sequences
KEYTIMEOUT=1

# sudo /etc/init.d/dbus start &> /dev/null

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

for file in ~/.{aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# pnpm
export PNPM_HOME="/Users/$USERNAME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(op completion zsh)"; compdef _op op

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
