cask "cc-cockpit" do
  version "0.1.0"
  sha256 "f5ed84bd61711cc1b22046dde73f98a224465a4100958a3046703735c67a4b21"

  url "https://github.com/BronOS/cc-cockpit/releases/download/v#{version}/cc-cockpit-#{version}-mac-arm64.dmg"
  name "cc-cockpit"
  desc "Desktop cockpit for Claude Code sessions"
  homepage "https://github.com/BronOS/cc-cockpit"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "cc-cockpit.app"

  zap trash: [
    "~/Library/Application Support/cc-cockpit",
    "~/Library/Caches/cc-cockpit",
    "~/Library/Logs/cc-cockpit",
    "~/Library/Preferences/dev.cc-cockpit.app.plist",
    "~/Library/Saved Application State/dev.cc-cockpit.app.savedState",
  ]

  caveats <<~EOS
    The app is not notarised, so macOS may refuse to open it the first time. The exact step has not
    been tested on a Mac yet. Usually it is System Settings > Privacy & Security > "Open Anyway", or:
    xattr -cr /Applications/cc-cockpit.app

    Quit cc-cockpit before upgrading, or restart it afterwards.
  EOS
end
