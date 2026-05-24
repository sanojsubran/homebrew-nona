class Nona < Formula
  desc "A filename normalizing tool"
  homepage "https://github.com/sanojsubran/nona"
  url "https://github.com/sanojsubran/nona/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e327dcaafd6fe015f4220a2f5d3fa8d36d078000ecafa32a7f37e262d4b18c7f"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    # Creates a temp file with spaces, renames it, checks result
    touch testpath/"hello world.txt"
    system bin/"nona", testpath/"hello world.txt"
    assert_predicate testpath/"hello-world.txt", :exist?
  end
end