require "language/go"
require "time"

class Easyssh < Formula
  desc "SSH-related aliases done right"
  homepage 'https://github.com/abesto/easyssh'
  head 'git@github.com:abesto/easyssh', :using => :git
  version '0.2.3'
  url "https://github.com/abesto/easyssh/archive/v#{version}.tar.gz"
  sha256 "b62679d4b3f49d9404ce735635249dc440c3364c1d699822dc5cca152e7dc85a"

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
