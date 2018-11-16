class Dexter < Formula
  desc "A command line tool to login to Vault using Github"
  homepage "https://github.com/opendoor-labs/dexter"
  url "https://s3.amazonaws.com/opendoor-brew-tap-bin/dexter-0.1.0.tar.gz"
  sha256 "dd797bc1c818cd8d896318147c28183660c710902c8ba1d00f1df6aade5dd5dc"
  version "0.1.0"

  depends_on "curl"

  bottle :unneeded

  def install
    bin.install "dexter"
  end
end
