class Webby < Formula
  desc "Webby is an opinionated web app generator for front-end projects at Opendoor."
  homepage "https://github.com/opendoor-labs/webby"
  url "https://github.com/opendoor-labs/webby/releases/download/0.2.1/webby",
    :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "5e374e72777d63d519db49e792cb2a8c749f9437a7d790f208a3b869f65e4962"

  bottle :unneeded

  def install
    bin.install "webby"
  end

  test do
    system "#{bin}/webby", "--version"
  end
end
