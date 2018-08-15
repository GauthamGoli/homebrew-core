class Di < Formula
  desc "Advanced df-like disk information utility"
  homepage "https://gentoo.com/di/"
  url "https://gentoo.com/di/di-4.47.tar.gz"
  sha256 "b5031c1f3b98536eee95fb91634fe700cec5e08a3cf38e14fffc47f969bf8a7e"

  bottle do
    cellar :any_skip_relocation
    sha256 "ade98ec67db4be6998cf0cf62a99d58cb67e357eac09c1b9590be4980050f742" => :high_sierra
    sha256 "b41b06335b72784f20a71e8932f58c751ad15496508a7362953b51c210a435ad" => :sierra
    sha256 "9f684e70615dde634dd78feaa4b32e03b203301c4ef888b12816182416e2817f" => :el_capitan
  end

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "#{bin}/di"
  end
end
