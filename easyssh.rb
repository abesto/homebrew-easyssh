require "language/go"
require "time"

class Easyssh < Formula
  desc "SSH-related aliases done right"
  homepage 'https://github.com/abesto/easyssh'
  head 'git@github.com:abesto/easyssh', :using => :git
  version '0.2.1'
  url "https://github.com/abesto/easyssh/archive/v#{version}.tar.gz"
  sha256 "f12fabf614ca9273560f5735f2caa594013fc8709be6a78e38c9f8f8361474ff"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    deep = buildpath/"src/github.com/abesto/easyssh"
    mkdir_p deep
    mv Dir['*'] - ['src'], deep

    Dir.chdir(deep) {
      system "go", "build", "-o", bin/"easyssh",
             '-ldflags', "-X main.VERSION=#{version} -X main.BUILD_DATE=#{Time.now.utc.iso8601}"
    }
  end
end
