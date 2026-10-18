# typed: false
# frozen_string_literal: true

class Infernosim < Formula
  desc "Deterministic incident replay for backend systems"
  homepage "https://github.com/pranaysparihar/InfernoSIM"
  url "https://github.com/pranaysparihar/InfernoSIM/archive/refs/tags/v4.2.1.tar.gz"
  sha256 "137ffc8a0b7cc12d73a723aacc2dfc38fb38a5bea51063be5b003f06c01b0a68"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version} -X main.commit=v#{version} " \
              "-X main.versionBy=homebrew -X infernosim/pkg/reporting.SemanticVersion=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/agent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/infernosim --version")
  end
end
