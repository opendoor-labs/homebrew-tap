class Webby < Formula
  desc "Webby is an opinionated web app generator for front-end projects at Opendoor."
  homepage "https://github.com/opendoor-labs/webby"
  url "https://github.com/opendoor-labs/webby/releases/download/0.2.3/webby",
    :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "21e26b4d69b61a7399a50a643ef3f1f50693a3b2865b11410ab384f3c51785d5"

  bottle :unneeded

  def install
    bin.install "webby"
  end

  test do
    system "#{bin}/webby", "--version"
  end
end
