class Nona < Formula
  desc "A filename normalizing tool"
  homepage "https://github.com/sanojsubran/nona"
  url "https://github.com/sanojsubran/nona/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "67567614d48ae5b26e2dec9ef6b9a563c2838aa3f3e004a3ee93a51e54825e38"
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