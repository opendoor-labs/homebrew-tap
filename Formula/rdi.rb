class Rdi < Formula
  desc "Command-line tool 'rdi' to create and manage Remote Development Instances"
  homepage "https://github.com/opendoor-labs/rdi"
  
  url "git@github.com:opendoor-labs/rdi", 
    using: :git,
    revision: "2cb3014ad7dc91136a9338e73f4f3178f03ea707"
  version "0.0.4"
  depends_on "awscli"
  depends_on "saml2aws"
  depends_on "jq"

  def install
    libexec.install "rdi", "ec2_script.sh", "ssh_config"
    bin.install_symlink libexec/"rdi"
  end

  test do
    assert_match "usage: rdi", shell_output("./rdi --help")
  end
end
