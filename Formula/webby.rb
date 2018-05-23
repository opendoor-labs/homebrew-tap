class Webby < Formula
  desc "Webby is an opinionated web app generator for front-end projects at Opendoor."
  homepage "https://github.com/opendoor-labs/webby"
  url "https://github.com/opendoor-labs/webby/releases/download/0.2.0/webby",
    :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "fa456a78afeaf470f040a4c287ecdd75baae31039592970223c9589ff66e6750"

  bottle :unneeded

  def install
    bin.install "webby"
  end

  test do
    system "#{bin}/webby", "--version"
  end
end
