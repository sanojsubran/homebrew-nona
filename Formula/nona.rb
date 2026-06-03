class Nona < Formula
  desc "A filename normalizing tool"
  homepage "https://github.com/sanojsubran/nona"
  url "https://github.com/sanojsubran/nona/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "b45b9bb530e7d9a0c22b61e7920f7451cf4f432c46e858008d06c2b499823f9f"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/nona"
  end

  test do
    # Creates a temp file with spaces, renames it, checks result
    touch testpath/"hello world.txt"
    system bin/"nona", testpath/"hello world.txt"
    assert_predicate testpath/"hello-world.txt", :exist?
  end
end