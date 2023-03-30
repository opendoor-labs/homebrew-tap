class Rdi < Formula
  desc "Command-line tool 'rdi' to create and manage Remote Development Instances"
  homepage "https://github.com/opendoor-labs/rdi"
  
  url "git@github.com:opendoor-labs/rdi", 
    using: :git,
    tag: "v0.0.14"
  version "0.0.14"
  depends_on "awscli"
  depends_on "saml2aws"
  depends_on "jq"

  def install
    libexec.install "rdi", "ec2_script.sh"
    bin.install_symlink libexec/"rdi"
  end

  test do
    assert_match "usage: rdi", shell_output("./rdi --help")
  end
end
