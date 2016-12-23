
# .zshrc
# http://www.machu.jp/b/ZshRc.html
##################

######## pass #########

export PATH=/usr/local/bin
export PATH=$PATH:/opt/local/bin:/opt/local/sbin/
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/X11R6/bin
export MANPATH=/usr/share/man:/usr/X11R6/man:/usr/local/man
export LD_LIBRARY_PATH="/home/kasahi/local/lib"
export PATH="$HOME/local/bin:$PATH"
export LOCALBASE=/home/kasahi/local

######## keymap #########

bindkey -e  #-e ... emacs �����Х���� , -v  ... vi �����Х����
bindkey "^?"    backward-delete-char
bindkey "^H"    backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line


######## history #########

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history # ����ե�����˻����Ͽ
setopt share_history # ������Υץ������Ȥ������ͭ
function history-all {
    history -E 1
}
setopt  hist_ignore_all_dups
setopt  hist_reduce_blanks
setopt CSH_NULL_GLOB


######## color #########

# font color_
local GRAY=$'%{\e[1;30m%}'
local LIGHT_GRAY=$'%{\e[0;37m%}'
local WHITE=$'%{\e[1;37m%}'
local LIGHT_BLUE=$'%{\e[1;36m%}'
local YELLOW=$'%{\e[1;33m%}'
local PURPLE=$'%{\e[1;35m%}'
local GREEN=$'%{\e[0;32m%}'
local BLUE=$'%{\e[0;34m%}'
local BLACK=$'%{\e[0;30m%}'
#local DEFAULT=$'%{\e[1;m%}'
# prompt color
PROMPT=$GREEN"${USER}@${HOSTNAME} $BLUE%(!.#.$) "$BLACK
RPROMPT=$BLUE"[%~]"$BLACK
#PROMPT=$GREEN"${USER}@${HOSTNAME} $BLUE%(!.#.$) "$WHITE
#RPROMPT=$BLUE"[%~]"$WHITE


######## abbreviation #########

typeset -A myabbrev
myabbrev=(
    "lg"    "| grep"
)

my-expand-abbrev() {
    local left prefix
    left=$(echo -nE "$LBUFFER" | sed -e "s/[_a-zA-Z0-9]*$//")
    prefix=$(echo -nE "$LBUFFER" | sed -e "s/.*[^_a-zA-Z0-9]\([_a-zA-Z0-9]*\)$/\1/")
    LBUFFER=$left${myabbrev[$prefix]:-$prefix}" "
}
zle -N my-expand-abbrev
bindkey     " "         my-expand-abbrev


autoload -U url-quote-magic
zle -N self-insert url-quote-magic

######## User specific aliases and functions #########

alias ls='ls -F'
alias ll='ls -Fl'
alias la='ls -Fa'
alias lla='ls -Fla'
alias -g G=' | grep '
alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'
alias less='less -N'
alias q='exit'
alias screen='screen -U'
alias rm='rm -i'
alias f='open .'

setopt PROMPT_SUBST
setopt share_history
setopt autopushd # cd�Υ����ߥ󥰤Ǽ�ưŪ��pushd
######## completion #########

# compinit�ν����
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#�䴰����򥫡����������Ǥ���_
#zstyle ':completion:*:default' menu select true

# ���Ĥ����䴰
zstyle ':completion:*' list-colors di=34 fi=0
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#export ZLS_COLORS='di=01;34' #�����䴰���θ���򥫥顼ɽ��

# �䴰���䤬ʣ��������ˡ�����ɽ��
#setopt auto_list

# �䴰������Tab, Ctrl+I) ��Ϣ�Ǥ�������ǽ���䴰�����ư���䴰
#setopt auto_menu

# ���å����б��ʤɤ�ưŪ���䴰
#setopt auto_param_keys

# �ǥ��쥯�ȥ�̾���䴰�������� / ��ưŪ���ղä��������䴰��������
#setopt auto_param_slash

#�䴰�ꥹ�Ȥ�8�ӥåȥ����ɤ�Ȥ�
# setopt PRINT_EIGHT_BIT

######## ENV #########

#export PAGER='lv -c'
#export LANG='ja_JP.eucJP'
#export LC_ALL=UTF-8
export LANG=ja_JP.UTF-8
export TERM='xterm-color'

######## Change the window title of X terminals #########

case $TERM in
        xterm*|rxvt|Eterm|eterm|kterm|cygwin)
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"';;
        screen)
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"';;
esac

unsetopt promptcr
