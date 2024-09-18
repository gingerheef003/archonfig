# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Initial Setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Keybindings
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"
key[Ctrl-H]="^H"
key[Ctrl-Delete]="^[[3;5~"

# [[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
# [[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
# [[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
# [[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
# [[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
# [[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
# [[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
# [[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
# [[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
# [[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
# [[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
# [[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
[[ -n "${key[Ctrl-H]}"       ]] && bindkey -- "${key[Ctrl-H]}"        backward-kill-word
[[ -n "${key[Ctrl-Delete]}"  ]] && bindkey -- "${key[Ctrl-Delete]}"   kill-word

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Aliases
alias sc="source $HOME/.zshrc"
alias c="tmuxifier s config"
alias d="cd $HOME/Downloads"
alias nv="nvim"
alias pac="sudo pacman"
alias p="sudo pacman -S"
alias pu="sudo pacman -Syu"
alias cat="bat"
alias grep="grep --color=auto"
alias ndw="nmcli device wifi"

# Git Aliases
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit --amend"
alias glg="git log --oneline --graph"
alias gd="git diff"
alias gcl="git clone"
alias gh="git push"
alias gl="git pull"
alias gr="git reflog"
alias gb="git branch"
alias go="git checkout"
alias gob="git checkout -b"

# ls Aliases
alias l="ls --color"
alias ll="ls --color -lh"
alias la="ls --color -lAh"
alias t="tree"

# Suffix Aliases
alias -s txt=nvim

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

eval "$(fzf --zsh)"


# Path
PATH=$HOME/.local/bin:$PATH
PATH=$HOME/.tmux/plugins/tmuxifier/bin:$PATH

# Virtual Environment
if [[ -f ./venv/bin/activate ]]; then
	source ./venv/bin/activate
fi
function cd() {
	builtin cd $1
	if [[ -f ./venv/bin/activate ]]; then
		source ./venv/bin/activate
	fi
}

EDITOR=nvim

# ctrl-backspace and ctrl-delete
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
