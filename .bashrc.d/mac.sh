alias spotlightoff='sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist'
alias spotlighton='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist'
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

function notify() {
  osascript -e "display notification \"\" with title \"$1\""
}

# Like the free command on gnu-linux
alias free=vm_stat\ \|\ perl\ \-ne\ \'\/page\ size\ of\ \(\\d\+\)\/\ and\ \$size\=\$1\;\ \/Pages\\s\+\(\[\^\:\]\+\)\[\^\\d\]\+\(\\d\+\)\/\ and\ printf\(\"\%\-16s\ \%\ 16\.2f\ Mi\\n\"\,\ \"\$1\:\"\,\ \$2\ \*\ \$size\ \/\ 1048576\)\;\'
