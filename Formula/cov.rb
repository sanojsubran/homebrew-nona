class Cov < Formula
  desc "A fast, intelligent currency conversion tool with smart number parsing"
  homepage "https://github.com/sanojsubran/cov"
  url "https://github.com/sanojsubran/cov/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256_UPDATE_WHEN_RELEASE_IS_TAGGED"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cov --version")
  end
end
