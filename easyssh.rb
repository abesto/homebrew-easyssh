require "language/go"

class Easyssh < Formula
  desc "SSH-related aliases done right"
  homepage 'https://github.com/abesto/easyssh'
  head 'git@github.com:abesto/easyssh', :using => :git
  version '0.1'
  url "https://github.com/abesto/easyssh/archive/v#{version}.tar.gz"
  sha256 "842fda46e9b13a8a3e04c539882ae3a16bd9d765616ffe708eb4a35b651e7e01"

  depends_on "go" => :build
  depends_on "godep" => :build

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/abesto/"
    ln_sf buildpath, buildpath/"src/github.com/abesto/easyssh"

    system "godep", "go", "build", "-o", bin/"easyssh"
  end
end
