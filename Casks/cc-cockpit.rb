cask "cc-cockpit" do
  version "0.21.2"
  sha256 "ab29264fdd42ea650cc6ab7e963af26b7eb3fdf8cef1e1ffdf7217ba010a8124"

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
    The app is not notarised, so the first time you open it macOS asks you to allow it. If it offers
    no way to, use System Settings > Privacy & Security > "Open Anyway".

    Quit cc-cockpit before upgrading, or restart it afterwards.
  EOS
end
