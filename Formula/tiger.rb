class Tiger < Formula
  desc "Read-only, up-to-date copies of other repos inside your project, for agents"
  homepage "https://github.com/mareszhar/tiger"
  license "AGPL-3.0-only"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.1/tiger-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "1e87b41b464bca7721473ce76d4cf347653994350d611dae9ec181c2d33277a6"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.1/tiger-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "29cc0f878e4fa84b8b63bcd9ae6f02b4b743d5961436b859a44dc8c7c42beaaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.1/tiger-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f723859775544ed2584d0936fe10d3b79b63b540d344adfca2c1ac1c5020d502"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.1/tiger-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ede493ffac360b0d2abb3c404d6039821573f161643653b895ca6701e43a7928"
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
