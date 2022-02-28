require_relative '../lib/download_strategy'

class Webby < Formula
  desc "Webby is an opinionated web app generator for front-end projects at Opendoor."
  homepage "https://github.com/opendoor-labs/webby"
  url "https://github.com/opendoor-labs/webby/releases/download/0.3.1/webby",
    :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "cded274176220922e13f5919d505ce9f3c41ee25c61fc4ab8c12447888818f7a"

  def install
    bin.install "webby"
  end

  test do
    system "#{bin}/webby", "--version"
  end
end
