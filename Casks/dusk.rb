cask "dusk" do
  version "0.1.0"
  sha256 "9c53385a785edb70dedbc97dedac84d5cece03844f1fe9a32ad01402bd29f26c"

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
  app_path = "#{appdir}/Dusk.app"
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", app_path],
        must_succeed: false
  end

  uninstall quit: "io.github.s-azizkhan.dusk"

  zap trash: "~/Library/Preferences/io.github.s-azizkhan.dusk.plist"
end
