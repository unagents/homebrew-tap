cask "binone" do
  version "0.3.0"
  sha256 "ab57f7c396fe9edafd8797669c5ed3b2600acc2a9b0a95cf8475be076cc56f3d"

  url "https://github.com/unagents/binone/releases/download/v#{version}/binone_#{version}_aarch64.dmg"
  name "binone"
  desc "Client app for binone, a task-driven supporter on top of bantou"
  homepage "https://github.com/unagents/binone"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "binone.app"

  preflight_steps do
    # The app is ad-hoc signed, so only the quarantine attribute is removed
    # (re-signing would break the hardened runtime flags).
    run "xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/binone.app"]
  end

  zap trash: [
    "~/Library/Application Support/jp.grrow.binone",
    "~/Library/Caches/jp.grrow.binone",
    "~/Library/WebKit/jp.grrow.binone",
  ]
end
