alias spotlightoff='sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist'
alias spotlighton='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist'

function notify() {
  osascript -e "display notification \"\" with title \"$1\""
}
