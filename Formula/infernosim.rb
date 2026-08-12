# typed: false
# frozen_string_literal: true

# This formula installs the release archive for the current platform.
class Infernosim < Formula
  desc "Deterministic incident replay for backend systems"
  homepage "https://github.com/pranaysparihar/InfernoSIM"
  version "3.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/pranaysparihar/InfernoSIM/releases/download/v3.4.0/InfernoSIM_3.4.0_darwin_amd64_v1.tar.gz"
      sha256 "efb1617451aebbd34be7fe8a17e063daea60e4ba8a80a772b13197b2505e849f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/pranaysparihar/InfernoSIM/releases/download/v3.4.0/InfernoSIM_3.4.0_darwin_arm64.tar.gz"
      sha256 "1a34c5b7995f940ac85729f2ddd9d73e4d1e32da6f932a3db0371826dbd22422"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/pranaysparihar/InfernoSIM/releases/download/v3.4.0/InfernoSIM_3.4.0_linux_amd64_v1.tar.gz"
      sha256 "e977bc8f532803d51684259780de43d6aaedb410bf3116464d4e3c936b17c9fc"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pranaysparihar/InfernoSIM/releases/download/v3.4.0/InfernoSIM_3.4.0_linux_arm64.tar.gz"
      sha256 "107b650c72a42197e920865d59e8d8d41881b11deb8283d7b4c97f9933c4b9d9"
    end
  end

  def install
    bin.install "infernosim"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/infernosim --version")
  end
end
