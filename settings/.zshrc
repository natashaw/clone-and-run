echo "⏳ Jump-starting your session ..."

### Plugins
plugins=(git gh bgnotify zsh-z fzf)
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

### iTerm2 Notification for Long Running Commands 
function bgnotify_formatted { ## args: (exit_status, command, elapsed_seconds)
    elapsed="$(( $3 % 60 ))s"
    (( $3 >= 60 )) && elapsed="$((( $3 % 3600) / 60 ))m $elapsed"
    (( $3 >= 3600 )) && elapsed="$(( $3 / 3600 ))h $elapsed"
    [ $1 -eq 0 ] && bgnotify "🍻 (took $elapsed)" "$2" || bgnotify "💔 (took $elapsed)" "$2"
  }

### Exports and Aliases
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Path to your oh-my-zsh installation.
export ZSH="/Users/natashawijoyo/.oh-my-zsh"

for file in ~/.{exports,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

echo "... ready! 🏎️ "