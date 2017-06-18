# Real man's LS.
if ls --color=auto >/dev/null 2>&1
  alias ls 'command ls -Alh --color=auto'
else
  alias ls 'command ls -Alh -G'
end

# Vim improved!
function vim
  if test -n "$NVIM_LISTEN_ADDRESS"
    command nvr --remote $argv
  else
    command nvim $argv
  end
end

# Quick Vim benchmark.
function vimstart
  vim --startuptime /dev/stdout +qall | sort -k3 | perl -nle 'print $& if m{(\d{3}\.\d{3}): sourcing /([[:alnum:][:punct:]]+)}'
end

# Homebrew
alias brewc='brew cleanup'
alias brewC='brew cleanup -S'
alias brewi='brew install'
alias brewl='brew leaves'
alias brewn='brew info'
alias brewo='brew outdated'
alias brewr='brew reinstall'
alias brews='brew search'
alias brewu='brew update; and brew upgrade'
alias brewx='brew uninstall'

# Homebrew Cask
alias cask='brew cask'
alias caskc='brew cask cleanup --outdated'
alias caskC='brew cask cleanup'
alias caski='brew cask install'
alias caskl='brew cask list'
alias caskn='brew cask info'
alias casko='brew cask outdated --greedy'
alias caskr='brew cask reinstall'
alias casks='brew cask search'
alias caskx='brew cask uninstall'
