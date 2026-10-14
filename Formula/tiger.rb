class Tiger < Formula
  desc "Read-only, up-to-date copies of other repos inside your project, for agents"
  homepage "https://github.com/mareszhar/tiger"
  license "AGPL-3.0-only"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.3/tiger-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "af27ef0583a140fc365349dafe66b1ade3342e06f337f8823b2c58a46d7036eb"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.3/tiger-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "d63f7061adcf65fe2c4f5195a2068b4d04cc5bdb11035331b9f6c01052dde4bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.3/tiger-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "282a8f97c617d2910fbba2cb81cfc1cbec8673e3c7c70751ec46df12b8ded798"
    end
    on_intel do
      url "https://github.com/mareszhar/tiger/releases/download/v0.2.3/tiger-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c23ac038ed3d5730b8913c664fc126ef31229978f4676f0019b5c84ca1a35e19"
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
