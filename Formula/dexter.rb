class Dexter < Formula
  desc "A command line tool to login to Vault using Github"
  homepage "https://github.com/opendoor-labs/dexter"
  url "https://s3.amazonaws.com/opendoor-brew-tap-bin/dexter-0.5.0.tar.gz"
  sha256 "23e55298a3ba00f4d3352f056bf7f4eaa401e314413f0d7f28bfeac55330f69b"
  version "0.5.0"

  depends_on "curl"

  bottle :unneeded

  def install
    bin.install "dexter"
  end
end
