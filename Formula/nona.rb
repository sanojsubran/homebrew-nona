class Nona < Formula
  desc "A filename normalizing tool"
  homepage "https://github.com/sanojsubran/nona"
  url "https://github.com/sanojsubran/nona/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "39c3190895929d6649691ae782cf0edb75c906ff9a83282e749f620e298b11de"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/nona"
  end

  test do
    # Creates a temp file with spaces, renames it, checks result
    touch testpath/"hello world.txt"
    system bin/"nona", testpath/"hello world.txt"
    assert_predicate testpath/"hello-world.txt", :exist?
  end
end