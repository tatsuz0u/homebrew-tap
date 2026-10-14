class Foldctl < Formula
  desc "Set the hinge angle and orientation of the iPhone Duo simulator"
  homepage "https://github.com/tatsuz0u/foldctl"
  url "https://github.com/tatsuz0u/foldctl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1b4c003cb2af5a8187425dfa8e141fe9a4cf6929d8844f432d6824cbfade784a"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on :xcode

  def install
    libexec.install "foldctl", "Sources", "Interfaces"
    # The script compiles the tool next to itself on first use; running it once here does that at install time.
    system libexec/"foldctl", "--help"
    bin.install_symlink libexec/"foldctl"
  end

  test do
    assert_match "usage: foldctl", shell_output("#{bin}/foldctl --help")
  end
end
