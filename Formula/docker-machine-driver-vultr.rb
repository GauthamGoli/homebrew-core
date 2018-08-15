class DockerMachineDriverVultr < Formula
  desc "Docker Machine driver plugin for Vultr Cloud"
  homepage "https://github.com/janeczku/docker-machine-vultr"
  url "https://github.com/janeczku/docker-machine-vultr/archive/v1.4.0.tar.gz"
  sha256 "f69b1b33c7c73bea4ab1980fbf59b7ba546221d31229d03749edee24a1e7e8b5"
  head "https://github.com/janeczku/docker-machine-vultr.git"

  bottle do
    cellar :any_skip_relocation
    rebuild 1
    sha256 "62f227cf1a4c854fc311024d892a40e71a061576a051818126a469f2213400ca" => :high_sierra
    sha256 "7af4e94255b4b0ffe451c7f73355adee8ca6fcc4e8a38ba7157acee1a3ba1409" => :sierra
    sha256 "50ae18bed6b26893049da20e16dbbcaaabbde2078df7fd6c9be6ce2e42f4f77a" => :el_capitan
  end

  depends_on "go" => :build
  depends_on "godep" => :build
  depends_on "docker-machine" => :recommended

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/janeczku/docker-machine-vultr").install buildpath.children

    cd "src/github.com/janeczku/docker-machine-vultr" do
      system "make"
      bin.install "build/docker-machine-driver-vultr-v#{version}" => "docker-machine-driver-vultr"
      prefix.install_metafiles
    end
  end

  test do
    assert_match "--vultr-api-endpoint",
      shell_output("#{Formula["docker-machine"].bin}/docker-machine create --driver vultr -h")
  end
end
