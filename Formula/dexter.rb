class Dexter < Formula
  desc "Command-line tool to login to Vault using Github"
  homepage "https://github.com/opendoor-labs/dexter"
  url "git@github.com:opendoor-labs/dexter",
      :using    => :git,
      :tag      => "v0.7.1",
      :revision => "9a3c20c119f1a2a0aa55fdbf488828edaa338178"
  head "git@github.com:opendoor-labs/dexter"
  # work around "//go:linkname must refer to declared function or variable" error
  # until our version of dexter can compile on go 1.18+
  depends_on "go@1.17" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/opendoor-labs/dexter").install buildpath.children

    cd "src/github.com/opendoor-labs/dexter" do
      system "make", "ARTIFACT=#{bin/"dexter"}", "OS=darwin", "BASE_VERSION=#{version}"
      prefix.install_metafiles
    end
  end

  test do
    assert_match "dexter is a authentication helper", shell_output("#{bin}/dexter")
  end
end
