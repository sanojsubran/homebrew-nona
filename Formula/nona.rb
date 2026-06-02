class Nona < Formula
  desc "A filename normalizing tool"
  homepage "https://github.com/sanojsubran/nona"
  url "https://github.com/sanojsubran/nona/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "b962ebe8db40dbc6c6ae9c50ac33129abe92f875b8e986b57310cdb90b9c64af"
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