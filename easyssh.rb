require "language/go"

class Easyssh < Formula
  desc "SSH-related aliases done right"
  homepage 'https://github.com/abesto/easyssh'
  head 'git@github.com:abesto/easyssh', :using => :git
  version '0.1.2'
  url "https://github.com/abesto/easyssh/archive/v#{version}.tar.gz"
  sha256 "77d59a7f7ec3369b0dc4737b194e97f232dc669f94130827973f7cf398ccb623"

  depends_on "go" => :build
  depends_on "godep" => :build

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/abesto/"
    ln_sf buildpath, buildpath/"src/github.com/abesto/easyssh"

    system "godep", "go", "build", "-o", bin/"easyssh"
  end
end
