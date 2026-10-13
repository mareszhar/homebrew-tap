class Tiger < Formula
  desc "Read-only, up-to-date copies of other repos inside your project, for agents"
  homepage "https://github.com/mareszhar/tiger"
  license "AGPL-3.0-only"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.1.0/tiger-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "d9a1d49a3927acaa0004499646fa13f69e6c991e4122f37036d5d17c167384a5"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.1.0/tiger-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "c95473e7f5e9c87d7042c047852071ae66de79d23ac089a6f221f813ba6929fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.1.0/tiger-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc6609cf871d759eda246cb0ed2672225d18862d981ba2d4b314de0ccc5dffa1"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.1.0/tiger-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ad61cd50ea4b1742f6d12ff5dc0fa91a8fe88f28742f0b2732ef97f49578e94"
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
