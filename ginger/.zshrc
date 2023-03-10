# Created by newuser for 5.9

# Command auto-completion
autoload -Uz compinit
compinit

# Arrow-key driven auto-completion interface
zstyle ':completion:*' menu select

# Key bindings
#-------------

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

[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# Making sure the terminal is in application mode, when zle is active 
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Match past commands from current cursor position
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search


# prompt theme
autoload -Uz promptinit
promptinit
prompt redhat

# Aliases
alias sc="source $HOME/.zshrc"
alias c="cd $HOME/archonfig"
alias d="cd $HOME/Downloads"
alias v='vim'
alias nv="nvim"
alias p="sudo pacman -S"
alias pu="sudo pacman -Syu"

# Git Aliases
alias g="git"
alias gt="git status"
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gl="git log --oneline"
alias gd="git diff"
alias gp="git push"

# ls Aliases
alias l="ls --color"
alias ll="ls --color -l"
alias la="ls --color -la"
alias t="tree"

# Suffix Aliases
alias -s txt=vim


# History
export HISTFILE=~/.zsh_history
export HISTSIZE=1024
export SAVEHIST=1024

# Fish-like
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aadding path
export PATH=/home/ginger/.local/bin:$PATH

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
