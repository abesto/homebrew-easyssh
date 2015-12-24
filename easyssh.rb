require "language/go"

class Easyssh < Formula
  desc "SSH-related aliases done right"
  homepage 'https://github.com/abesto/easyssh'
  head 'git@github.com:abesto/easyssh', :using => :git
  version '0.1.1'
  url "https://github.com/abesto/easyssh/archive/v#{version}.tar.gz"
  sha256 "6f6e2eee854a4139b0bb900915d4407758cdfc3395f7aa57a7bb3d425669df44"

  depends_on "go" => :build
  depends_on "godep" => :build

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/abesto/"
    ln_sf buildpath, buildpath/"src/github.com/abesto/easyssh"

    system "godep", "go", "build", "-o", bin/"easyssh"
  end
end
