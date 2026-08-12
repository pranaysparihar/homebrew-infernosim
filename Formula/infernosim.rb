# typed: false
# frozen_string_literal: true

class Infernosim < Formula
  desc "Deterministic incident replay for backend systems"
  homepage "https://github.com/pranaysparihar/InfernoSIM"
  url "https://github.com/pranaysparihar/InfernoSIM/archive/refs/tags/v3.4.0.tar.gz"
  sha256 "6bc418dfbfdebfd9aaaaa6104eb3e1d56c20ed0437a54a899fb41a7086713513"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version} -X main.commit=v#{version} " \
              "-X main.versionBy=homebrew -X infernosim/pkg/reporting.SemanticVersion=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/agent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/infernosim --version")
  end
end
