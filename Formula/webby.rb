class Webby < Formula
  desc "Webby is an opinionated web app generator for front-end projects at Opendoor."
  homepage "https://github.com/opendoor-labs/webby"
  url "https://github.com/opendoor-labs/webby/releases/download/0.2.2/webby",
    :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "eed30fceb437e24a0db51d01b99a5d2adb3d7713c83239036e95fbf41f6cc872"

  bottle :unneeded

  def install
    bin.install "webby"
  end

  test do
    system "#{bin}/webby", "--version"
  end
end
