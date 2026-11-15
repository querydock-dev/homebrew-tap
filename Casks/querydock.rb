cask "querydock" do
  version "1.0.1"
  sha256 "9ebc94bf924943c9123c57c6f005ed3da8bc40e2626df76db9bb5aeaf09caaed"

  url "https://github.com/Novus-Lab-Dev/querydock-releases/releases/download/v#{version}/QueryDock_#{version}_universal.dmg"
  name "QueryDock"
  desc "Modern Native-Grade Database GUI Client for PostgreSQL, MySQL, and SQLite"
  homepage "https://github.com/Novus-Lab-Dev/querydock-releases"

  auto_updates true

  app "QueryDock.app"

  # QueryDock is not yet signed/notarized with an Apple Developer ID, so
  # Gatekeeper would block the first launch. Clear the quarantine flag
  # Homebrew sets on download (same as the curl installer does).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/QueryDock.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.querydock.client",
    "~/Library/Caches/com.querydock.client",
    "~/Library/Preferences/com.querydock.client.plist",
    "~/Library/Saved Application State/com.querydock.client.savedState",
  ]
end
