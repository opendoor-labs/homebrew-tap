class Webby < Formula
  desc "Webby is an opinionated web app generator for front-end projects at Opendoor."
  homepage "https://github.com/opendoor-labs/webby"
  url "https://github.com/opendoor-labs/webby/releases/download/0.2.8/webby",
    :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "fd0b5aa204ece2007e571bc696665170d8ff569d0b856ca3851edcc9f58c3111"

  bottle :unneeded

  def install
    bin.install "webby"
  end

  test do
    system "#{bin}/webby", "--version"
  end
end
