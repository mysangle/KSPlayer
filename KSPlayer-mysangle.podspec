Pod::Spec.new do |s|
    s.name             = 'KSPlayer-mysangle'
    s.version          = '1.1.9'
    s.summary          = 'Video Player Using Swift, based on AVPlayer,FFmpeg'

    s.description      = <<-DESC
    Video Player Using Swift, based on ffmpeg, support for the horizontal screen, vertical screen, the upper and lower slide to adjust the volume, the screen brightness, or so slide to adjust the playback progress.
    DESC

    s.homepage         = 'https://github.com/mysangle/KSPlayer-mysangle'
    s.authors = { 'mysangle' => 'mysangle@gmail.com' }
    s.license          = 'MIT'
    s.source           = { :git => 'https://github.com/mysangle/KSPlayer-mysangle.git', :tag => "#{s.version}" }

    s.swift_version = "5.7"
    s.ios.deployment_target = '13.0'

    s.static_framework = true
    #s.source_files = "Sources/KSPlayer-mysangle/**/*.swift"
    #s.dependency 'FFmpegKit-mysangle', '1.1.0'
    #s.dependency 'OpenSSL-mysangle', '1.1.0'

    s.subspec 'MEPlayer' do |ss|
        ss.source_files = 'Sources/KSPlayer-mysangle/**/*.{swift}'
        ss.frameworks  = 'AudioToolbox', 'VideoToolbox'
        ss.dependency 'FFmpegKit-mysangle'
    end

end
