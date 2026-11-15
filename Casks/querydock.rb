cask "querydock" do
  version "1.0.1"
  sha256 "9ebc94bf924943c9123c57c6f005ed3da8bc40e2626df76db9bb5aeaf09caaed"

  url "https://github.com/Novus-Lab-Dev/querydock-releases/releases/download/v#{version}/QueryDock_#{version}_universal.dmg"
  name "QueryDock"
  desc "Modern Native-Grade Database GUI Client for PostgreSQL, MySQL, and SQLite"
  homepage "https://github.com/Novus-Lab-Dev/querydock-releases"

  auto_updates true

  app "QueryDock.app"

  zap trash: [
    "~/Library/Application Support/com.querydock.client",
    "~/Library/Caches/com.querydock.client",
    "~/Library/Preferences/com.querydock.client.plist",
    "~/Library/Saved Application State/com.querydock.client.savedState",
  ]
end
