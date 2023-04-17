cask "openai-translator" do
    arch arm: "aarch64", intel: "x64"

    version "0.0.37"
    sha256 arm: "9e4e4d692de5e1ac5db9a89dab9520d2417ed3894335ecc906503ce7cadfae19",
         intel: "f70ac5943f7f5c31e37f56e2d424be8d32269b7b93e3672743e0a9e25846a034"

    url "https://github.com/yetone/openai-translator/releases/download/v#{version}/OpenAI.Translator_#{version}_#{arch}.dmg"
    name "OpenAI Translator"
    desc "Cross-platform desktop application for translation based on ChatGPT API."
    homepage "https://github.com/yetone/openai-translator"

    livecheck do
      url :url
      strategy :github_latest
    end

    app "OpenAI Translator.app"

    postflight do
        system_command '/usr/bin/xattr',
                args: [
                        '-d', 'com.apple.quarantine',
                        "#{staged_path}/OpenAI\ Translator.app"
                      ],
                sudo: true
   end


    zap trash: [
      "~/Library/Preferences/xyz.yetone.apps.openai-translator",
      "~/Library/Saved Application State/xyz.yetone.apps.openai-translator.savedState",
    ]
end