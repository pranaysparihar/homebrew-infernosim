# typed: false
# frozen_string_literal: true

class Infernosim < Formula
  desc "Deterministic incident replay for backend systems"
  homepage "https://github.com/pranaysparihar/InfernoSIM"
  url "https://github.com/pranaysparihar/InfernoSIM/archive/refs/tags/v4.1.0.tar.gz"
  sha256 "fabc76ffe819bda97f3a995d90cb3deea26047ad2fa6e499d61401cfd163d34c"
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
