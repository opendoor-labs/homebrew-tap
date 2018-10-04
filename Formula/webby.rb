class Webby < Formula
  desc "Webby is an opinionated web app generator for front-end projects at Opendoor."
  homepage "https://github.com/opendoor-labs/webby"
  url "https://github.com/opendoor-labs/webby/releases/download/0.3.0/webby",
    :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "5205b5136b45c0f3b143bc5f642e57e6af7e43c3939ad1a939451af59953914f"

  bottle :unneeded

  def install
    bin.install "webby"
  end

  test do
    system "#{bin}/webby", "--version"
  end
end
