class Tokenbox < Formula
  desc "Store secrets encrypted in a git repo, retrieve them by git URL and key name"
  homepage "https://github.com/unagents/tokenbox"
  version "0.1.1"

  on_arm do
    url "https://github.com/unagents/tokenbox/releases/download/v0.1.1/tokenbox-v0.1.1-aarch64-apple-darwin.tar.gz"
    sha256 "0e8e4c4f8fa7c917e4c0c4173b731f998a50803da72304732ae337416a4e3b63"
  end

  on_intel do
    url "https://github.com/unagents/tokenbox/releases/download/v0.1.1/tokenbox-v0.1.1-x86_64-apple-darwin.tar.gz"
    sha256 "1bbabb74f3ca4756aef5741ccb01190f0f7d3eca42536d4173a9b7eb4f6fbfbf"
  end

  depends_on :macos

  def install
    bin.install "tokenbox"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tokenbox --version")
  end
end
