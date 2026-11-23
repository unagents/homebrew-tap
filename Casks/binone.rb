cask "binone" do
  version "0.1.1"
  sha256 "15f336923a29c54d5b98b251f7a1a3f2fe040e46b7c2e3edd19f23624239bccc"

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
