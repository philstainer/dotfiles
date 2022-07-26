# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

for file in ~/.{exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# sudo apt-get install zsh
# sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Set zsh as the default shell using: chsh -s $(which zsh)
# Set Bash as the default shell using: chsh -s $(which bash)

plugins=(git docker docker-compose pip)
plugins+=(tmux tmuxinator yarn npm)
plugins+=(z zsh-autosuggestions history)

# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# ZSH_TMUX_AUTOSTART=true
# ZSH_TMUX_AUTOQUIT=true
# ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_FIXTERM=true

[[ ! -f $ZSH/oh-my-zsh.sh ]] || source $ZSH/oh-my-zsh.sh

# 10ms for key sequences
KEYTIMEOUT=1

sudo /etc/init.d/dbus start &> /dev/null

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
