class Edgar < Formula
  desc "Native Swift client for SEC EDGAR — 13F portfolios, XBRL financials, insider trades"
  homepage "https://github.com/ElveanApp/swift-edgar"
  url "https://github.com/ElveanApp/swift-edgar/archive/refs/tags/1.0.0.tar.gz"
  sha256 "a4b89e4d6ed35ad4373336e4416033404438c7f5ad21d3c651e2af9c8f35a502"
  license "MIT"
  version "1.0.0"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/edgar"
  end

  test do
    assert_match "Edgar — SEC EDGAR CLI", shell_output("#{bin}/edgar help")
  end
end
