cask "querydock" do
  version "1.0.3"
  sha256 "5aa36aac0cadbb082e894a660b4e8c3b0fa054d47d94dd2a4375e3106b656aa2"

  url "https://github.com/querydock-dev/querydock-releases/releases/download/v#{version}/QueryDock_#{version}_universal.dmg"
  name "QueryDock"
  desc "Modern Native-Grade Database GUI Client for PostgreSQL, MySQL, and SQLite"
  homepage "https://github.com/querydock-dev/querydock-releases"

  auto_updates true
  depends_on :macos

  app "QueryDock.app"

  # QueryDock is not yet signed/notarized with an Apple Developer ID, so
  # Gatekeeper would block the first launch. Clear the quarantine flag
  # Homebrew sets on download (same as the curl installer does).
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/QueryDock.app"],
        writable_paths: ["QueryDock.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/Library/Application Support/com.querydock.client",
    "~/Library/Application Support/com.querydock.desktop",
    "~/Library/Application Support/com.tableplusrs.desktop",
    "~/Library/Caches/com.querydock.client",
    "~/Library/HTTPStorages/com.querydock.client",
    "~/Library/Preferences/com.querydock.client.plist",
    "~/Library/Saved Application State/com.querydock.client.savedState",
    "~/Library/WebKit/com.querydock.client",
  ]
end
