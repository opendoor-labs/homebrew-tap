require 'language/go'

class Gothumb < Formula
  desc 'gothumb'
  homepage 'https://github.com/opendoor-labs/gothumb'

  url 'https://github.com/opendoor-labs/gothumb.git',
    :tag => 'v0.4',
    :revision => 'b9b48eb213a90f862ab10b263af33f3df14df9dc'

  depends_on 'vips'
  depends_on 'go' => :build
  depends_on 'glib' => :build
  depends_on 'libpng'
  depends_on 'libtiff'
  depends_on 'pkg-config' => :build

  def install
    ENV['GOPATH'] = buildpath
    mkdir_p buildpath/'src/github.com/opendoor-labs/'
    ln_sf buildpath, buildpath/'src/github.com/opendoor-labs/gothumb'
    Language::Go.stage_deps resources, buildpath/"src"

    ENV['CGO_CFLAGS_ALLOW'] = '-Wl,(-framework|CoreFoundation)'
    system 'go', 'build', '-o', 'gothumb', '.'
    bin.install 'gothumb'
  end

  plist_options :manual => 'gothumb -l localhost:8787 -unsafe -max-age 604800'

  def plist_name
    'homebrew.opendoor.gothumb'
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>KeepAlive</key>
        <true/>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/gothumb</string>
          <string>-l</string>
          <string>localhost:8787</string>
          <string>-unsafe</string>
          <string>-max-age</string>
          <string>604800</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>WorkingDirectory</key>
        <string>#{var}</string>
      </dict>
    </plist>
    EOS
  end

  test do
    system bin/'gothumb -h'
  end
end
