class Tokenbox < Formula
  desc "Store secrets encrypted in a git repo, retrieve them by git URL and key name"
  homepage "https://github.com/unagents/tokenbox"
  version "0.1.0"

  on_arm do
    url "https://github.com/unagents/tokenbox/releases/download/v0.1.0/tokenbox-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "0887f204a4544e9ecc427dc69ccd95c1dac68d24c2aa12da8ad0b65a146e1449"
  end

  on_intel do
    url "https://github.com/unagents/tokenbox/releases/download/v0.1.0/tokenbox-v0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "0c75a056ad0dd857a565f74e5079f3171e815e393859406dace8a0fcbfa6406c"
  end

  depends_on :macos

  def install
    bin.install "tokenbox"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tokenbox --version")
  end
end
