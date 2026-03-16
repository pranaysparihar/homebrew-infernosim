class Infernosim < Formula
  desc "Deterministic incident replay for backend systems"
  homepage "https://github.com/pranaysparihar/InfernoSIM"
  url "https://github.com/pranaysparihar/InfernoSIM/releases/download/v3.0.0/InfernoSIM_3.0.0_darwin_arm64.tar.gz"
  sha256 "SHA256_FROM_CHECKSUMS"
  license "MIT"

  def install
    bin.install "InfernoSIM"
  end

  test do
    system "#{bin}/infernosim", "version"
  end
end
