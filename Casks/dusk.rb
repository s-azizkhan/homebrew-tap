cask "dusk" do
  version "0.2.0"
  sha256 "208408c0e7f08d43632955682495ae03cedb3bd28e3c5702f73b12c60d8da115"

  url "https://github.com/s-azizkhan/dusk-mac/releases/download/v#{version}/Dusk-macOS.zip"
  name "Dusk"
  desc "Blue light filter and flicker-free screen dimmer"
  homepage "https://s-azizkhan.github.io/dusk-mac/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Dusk.app"

  # Ad-hoc signed, not notarised yet.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "/Applications/Dusk.app"],
        must_succeed: false
  end

  uninstall quit: "io.github.s-azizkhan.dusk"

  zap trash: "~/Library/Preferences/io.github.s-azizkhan.dusk.plist"
end
