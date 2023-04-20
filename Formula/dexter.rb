class Dexter < Formula
  desc "Command-line tool to login to Vault using Github"
  homepage "https://github.com/opendoor-labs/dexter"
  url "git@github.com:opendoor-labs/dexter",
      :using    => :git,
      :tag      => "v0.7.4",
      :revision => "4bda18069c602c525134c2c4868ab562085ec01b"
  head "git@github.com:opendoor-labs/dexter"
  depends_on "go" => :build

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
