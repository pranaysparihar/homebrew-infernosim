# typed: false
# frozen_string_literal: true

class Infernosim < Formula
  desc "Deterministic incident replay for backend systems"
  homepage "https://github.com/pranaysparihar/InfernoSIM"
  url "https://github.com/pranaysparihar/InfernoSIM/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "8f5e206572128eb12b2ddd5b03c7d482c3bc8949dc626876abaf01b6dea661eb"
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
