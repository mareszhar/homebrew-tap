class Tiger < Formula
  desc "Read-only, up-to-date copies of other repos inside your project, for agents"
  homepage "https://github.com/mareszhar/tiger"
  license "AGPL-3.0-only"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.5/tiger-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "f53e82e466e30baaa491df62423d8b7ef0260ec599e7d9cc18c4e9ccc5458f37"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.5/tiger-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "575b6e77aa5c84b531a229e16bf077d72556b17ffd27e457989315841b858702"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.5/tiger-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f61c987a85bb6ff517fe6bea6e7213734421a4741fa3498bc875ae52e6d40af"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.5/tiger-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5455b5e02790b5a6e6f0851dfdcdade2aa8acd8e3f0aab45d99aa93ed07c873c"
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
