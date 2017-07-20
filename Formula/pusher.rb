class Pusher < Formula
  desc 'pusher'
  homepage 'https://github.com/opendoor-labs/pusher'
  version '0.7'

  url 'https://github.com/opendoor-labs/pusher.git',
    :revision => '3342f9a57589311debf23a20d263766f2f9da944'

  depends_on 'elixir'
  depends_on 'redis'

  def install
    ENV['MIX_ENV'] = 'brew'
    system 'mix', 'local.hex', '--force'
    system 'mix', 'local.rebar', '--force'
    system 'mix', 'deps.get'
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
