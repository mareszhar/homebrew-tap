class Tiger < Formula
  desc "Read-only, up-to-date copies of other repos inside your project, for agents"
  homepage "https://github.com/mareszhar/tiger"
  license "AGPL-3.0-only"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.0/tiger-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "c18fb0ac9023a5ad61456c46af679e8ccc9e52100daf2f78c1073e61e2140881"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.0/tiger-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "aee234cf9be4d290682a5aa56f447fa3f3453d92a52f522af2001c08bd0ded92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.0/tiger-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2356f9026c0315739465f44a1470c9302b30d9815becc828d476a20fa61ebc79"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.0/tiger-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd88680463610a4da2cb2d2ace9df783f579254d35f32af550f36094385937b6"
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
