class Pusher < Formula
  desc 'pusher'
  homepage 'https://github.com/opendoor-labs/pusher'

  url 'https://github.com/opendoor-labs/pusher.git',
    :tag => 'v0.1',
    :revision => '81db1e9cd06a6ef5a744589335cc8ad817fd9e58'

  depends_on 'elixir'
  depends_on 'redis'

  def install
    ENV['MIX_ENV'] = 'brew'
    system 'mix', 'local.hex', '--force'
    system 'mix', 'local.rebar', '--force'
    system 'mix', 'archive.install', 'https://github.com/phoenixframework/phoenix/releases/download/v1.0.3/phoenix_new-1.0.3.ez', '--force'
    system 'mix', 'deps.get'
    system 'mix', 'phoenix.digest'
    system 'mix', 'release'
    cp_r Dir.glob('rel/pusher/*'), prefix
  end

  def plist_name
    'homebrew.opendoor.pusher'
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
        <key>EnvironmentVariables</key>
        <dict>
          <key>PORT</key>
          <string>8585</string>
          <key>MIX_ENV</key>
          <string>brew</string>
        </dict>
        <key>KeepAlive</key>
        <true/>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{prefix}/bin/pusher</string>
          <string>foreground</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>#{prefix}</string>
      </dict>
    </plist>
    EOS
  end

  test do
    system 'mix --version'
  end
end
