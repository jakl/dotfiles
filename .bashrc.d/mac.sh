alias spotlightoff='sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist'
alias spotlighton='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist'
alias fin="osascript -e 'say \"fin\"' && osascript -e 'display alert \"script done\"'"

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

function notify() {
  osascript -e "display notification \"\" with title \"$1\""
}

# Like the free command on gnu-linux
alias free=vm_stat\ \|\ perl\ \-ne\ \'\/page\ size\ of\ \(\\d\+\)\/\ and\ \$size\=\$1\;\ \/Pages\\s\+\(\[\^\:\]\+\)\[\^\\d\]\+\(\\d\+\)\/\ and\ printf\(\"\%\-16s\ \%\ 16\.2f\ Mi\\n\"\,\ \"\$1\:\"\,\ \$2\ \*\ \$size\ \/\ 1048576\)\;\'

export ANDROID_HOME=~/Library/Android/sdk
PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

# Homebrew executables
PATH="$PATH:/usr/local/sbin"
# brew install openjdk then this adds it to path
PATH="/usr/local/opt/openjdk/bin/:$PATH"

# Homebrew autocomplete
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi
