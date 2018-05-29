class Webby < Formula
  desc "Webby is an opinionated web app generator for front-end projects at Opendoor."
  homepage "https://github.com/opendoor-labs/webby"
  url "https://github.com/opendoor-labs/webby/releases/download/0.2.1/webby",
    :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "24d7cdace4c6bc96b3204847853d1ad3363873e65a03feda8120ca64127eecd2"

  bottle :unneeded

  def install
    bin.install "webby"
  end

  test do
    system "#{bin}/webby", "--version"
  end
end
