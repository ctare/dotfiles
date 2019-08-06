export HISTFILE=$HOME/.zsh_history
export HISTSIZE=5000
export SAVEHIST=20000
export LSCOLORS=gxfxcxdxcxegedabagacad

COLOR_PALETTE=''
for i in $(seq 0 255); do
  COLOR_PALETTE="${COLOR_PALETTE}[38;5;${i}m${i};"
done

autoload -Uz compinit && compinit
# zgen
if [[ ! -d ~/.zgen ]]; then
  git clone https://github.com/tarjoilija/zgen.git ~/.zgen
fi
ZGEN_RESET_ON_CHANGE=(${HOME}/.zsh/plugins.zsh)
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
  # zgen oh-my-zsh
  source "${HOME}/.zsh/plugins.zsh"
  zgen save
fi

source "${HOME}/.zsh/aliases.zsh"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

PROMPT="%{[38;5;247m%}%n%f: %~%(!.#.%%) %{[0m%}"
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

if [[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]]; then
    PROMPT="%B%F{magenta}[${USER}@${HOST}]%f:%F{blue}%2~%f%b%(!.#.%%) "
fi
export LANG=ja_JP.UTF-8

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt EXTENDED_HISTORY
setopt correct
setopt print_eight_bit
setopt magic_equal_subst
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
fignore=(CVS .class)

function mkcd(){
	mkdir -p $1; cd $1
}

export XDG_CONFIG_HOME=${HOME}/.config/

disable r
bindkey -v
