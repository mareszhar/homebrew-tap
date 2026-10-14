class Tiger < Formula
  desc "Read-only, up-to-date copies of other repos inside your project, for agents"
  homepage "https://github.com/mareszhar/tiger"
  license "AGPL-3.0-only"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.2/tiger-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "c0ac04d505c84eb7225e399a779af58f25074377bb65956e306038db5ab49df7"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.2/tiger-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "3a4b6c476ce1bc6ea369efca2a5518067658b1228c4777eca8c0360a82340424"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.2/tiger-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "73f8ecc9be2817b3c7f67f30669a6e5a34073100c5ca637ac79eab50eb1067d8"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.2/tiger-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89c1c43a022b701754cc113e73d96bd4f992cdb80c6459a673a726d0aefcb6ab"
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
