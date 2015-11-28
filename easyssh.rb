require "language/go"

class Easyssh < Formula
  desc "SSH-related aliases done right"
  homepage 'https://github.com/abesto/easyssh'
  head 'git@github.com:abesto/easyssh', :using => :git
  version '0.1.1-alpha.1'
  url "https://github.com/abesto/easyssh/archive/v#{version}.tar.gz"
  sha256 "def7ea1117c64492fe5bff82ac642e3d145efccd5996c38e8f4d38dcb59768d8"

  depends_on "go" => :build
  depends_on "godep" => :build

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/abesto/"
    ln_sf buildpath, buildpath/"src/github.com/abesto/easyssh"

    system "godep", "go", "build", "-o", bin/"easyssh"
  end
end
