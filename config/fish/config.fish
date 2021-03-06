# Environment

set --global --export LANG en_US.UTF-8

set --global --export XDG_DATA_HOME   $HOME/.local/share
set --global --export XDG_CACHE_HOME  $HOME/.cache
set --global --export XDG_CONFIG_HOME $HOME/.config

set --global --export TMP /tmp
set --global --export PATH \
  $HOME/bin \
  /usr/local/{,s}bin \
  /usr/{,s}bin \
  /{,s}bin

test -d /Library/TeX/texbin; and set --global --export PATH $PATH /Library/TeX/texbin # osx
test -d /opt/X11/bin; and set --global --export PATH $PATH /opt/X11/bin # osx

set --global --export EDITOR nvim
set --global --export BROWSER google-chrome
set --global --export LESS -R

#set --global --export FZF_TMUX 1
set --global --export FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*" ^/dev/null' # fzf <3 rg
set --global --export FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set --global --export FZF_ALT_C_COMMAND 'find -L . -type d -mindepth 1 -printf "%P\n" ^/dev/null'
set --global --export FZF_DEFAULT_OPTS '--color fg:-1,bg:-1,hl:4,fg+:7,bg+:0,hl+:4 --color info:3,prompt:3,pointer:15,marker:15,spinner:3'

#test -d /usr/lib/ccache/bin; and set --global --export PATH /usr/lib/ccache/bin $PATH # arch
#test -d /usr/local/opt/ccache/libexec; and set --global --export PATH /usr/local/opt/ccache/libexec $PATH # osx
test -d /usr/local/opt/coreutils/libexec/gnubin; and set --global --export PATH /usr/local/opt/coreutils/libexec/gnubin $PATH # osx
test -d /usr/local/opt/findutils/libexec/gnubin; and set --global --export PATH /usr/local/opt/findutils/libexec/gnubin $PATH # osx
#test -d /usr/bin/core_perl; and set --global --export PATH /usr/bin/{core,site,vendor}_perl $PATH

#test -d $HOME/.rbenv/bin; and set --global --export PATH $HOME/.rbenv/bin $PATH; and source (rbenv init -|psub)
#test -d $HOME/.pyenv/bin; and set --global --export PATH $HOME/.pyenv/bin $PATH; and source (pyenv init -|psub); and source (pyenv virtualenv-init -|psub)

#set --global --export GOPATH $HOME/.go; test -d $GOPATH/bin; or mkdir -p $GOPATH/bin
#set --global --export PATH $GOPATH/bin $PATH

test -d $HOME/.fzf/bin; and set --global --export PATH $HOME/.fzf/bin $PATH

for dircolors in {,g}dircolors
  type -fp $dircolors >/dev/null 2>&1; and source (eval "$dircolors --c-shell ~/.dircolorsrc|psub")
end

test -f $HOME/.config/fish/config.local.fish; and source $HOME/.config/fish/config.local.fish

# Startup

set fish_greeting # shut up

if [ (ps -o comm= (ps -o ppid= %self | tr -d '[:space:]')) = "mosh-server" ]
  set --global --export MOSH 1
end

if status --is-interactive
  #set --global --export GPG_TTY (tty)
  #set --global --export SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
  #gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1

  #if test -z "$TMUX"; and test -z "$SSH_CLIENT"; and test -z "$SSH_TTY"
  #  if not status --is-login; or test (uname) = "Darwin"
  #    tmux has-session -t 0; and tmux new-session -t 0 \; set-option destroy-unattached; or tmux new-session -s 0
  #  end
  #end

  #tput smkx ^/dev/null # fix backspace in st
  #function fish_enable_keypad_transmit --on-event fish_postexec
  #  tput smkx ^/dev/null
  #end
  #function fish_disable_keypad_transmit --on-event fish_preexec
  #  tput rmkx ^/dev/null
  #end
end
