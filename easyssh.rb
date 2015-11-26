require "language/go"

class Easyssh < Formula
  desc "SSH-related aliases done right"
  homepage 'https://github.com/abesto/easyssh'
  head 'git@github.com:abesto/easyssh', :using => :git
  url "https://github.com/abesto/easyssh/archive/v0.1-alpha.5.tar.gz"
  sha256 "2b5a9cdfa157289a591aba0d2427ac744eeec46faf36f921401995f8ee79bf53"

  depends_on "go" => :build
  depends_on "godep" => :build

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/abesto/"
    ln_sf buildpath, buildpath/"src/github.com/abesto/easyssh"

    system "godep", "go", "build", "-o", bin/"easyssh"
  end
end
