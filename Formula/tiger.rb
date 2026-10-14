class Tiger < Formula
  desc "Read-only, up-to-date copies of other repos inside your project, for agents"
  homepage "https://github.com/mareszhar/tiger"
  license "AGPL-3.0-only"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.4/tiger-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "ccec1b86c9cd3ea20604c1602889d4bb6f2fea1a7f83ad787a448689b524f00d"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.4/tiger-v0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "dc76ef0afbde2f253bcee6eeddb9e0242317beefaea1c0759c3f9a1636bf1cdf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.4/tiger-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c0f390d07a98d3117c610c496c58f525197956c697175952f4b395911f79c499"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.4/tiger-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12e79c9ce59f3c47d8b5625da3eaef0a9e4ba6fb2780bffda2176a9d2eae038f"
    end
  end

  def install
    bin.install "tiger"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tiger --version")
    system bin/"tiger", "init", "--no-gitignore"
    assert_path_exists testpath/"tiger.toml"
  end
end
