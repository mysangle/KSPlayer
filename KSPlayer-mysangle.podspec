Pod::Spec.new do |s|
    s.name             = 'KSPlayer-mysangle'
    s.version          = '1.1.6'
    s.summary          = 'Video Player Using Swift, based on AVPlayer,FFmpeg'

    s.description      = <<-DESC
    Video Player Using Swift, based on ffmpeg, support for the horizontal screen, vertical screen, the upper and lower slide to adjust the volume, the screen brightness, or so slide to adjust the playback progress.
    DESC

    s.homepage         = 'https://github.com/mysangle/KSPlayer-mysangle'
    s.authors = { 'mysangle' => 'mysangle@gmail.com' }
    s.license          = 'MIT'
    s.source           = { :git => 'https://github.com/mysangle/KSPlayer-mysangle.git', :tag => s.version.to_s }

    s.platform = :ios
    s.swift_version = "5.7"
    s.ios.deployment_target = '13.0'
    s.static_framework = true
    s.subspec 'Subtitle' do |ss|
        ss.source_files = 'Sources/KSPlayer_mysangle/Subtitle/*.{swift}'
        ss.frameworks = 'Foundation'
    end
    s.subspec 'Metal' do |ss|
        ss.source_files = 'Sources/KSPlayer_mysangle/Metal/*.{swift,metal}'
        ss.resource_bundles = {
            'KSPlayer_KSPlayer' => ['Sources/KSPlayer_mysangle/Metal/*.metal']
        } 
        ss.weak_framework = 'MetalKit'
        ss.ios.frameworks  = 'UIKit'
    end
    #AVPlayer播放内核
    s.subspec 'AVPlayer' do |ss|
        ss.source_files = 'Sources/KSPlayer_mysangle/AVPlayer/*.{swift}'
        ss.frameworks = 'AVFoundation'
        ss.ios.frameworks  = 'UIKit'
    end
    #ffmpeg播放内核
    s.subspec 'MEPlayer' do |ss|
        ss.source_files = 'Sources/KSPlayer_mysangle/MEPlayer/**/*.{swift}'
        ss.frameworks  = 'AudioToolbox', 'VideoToolbox'
        ss.dependency 'FFmpegKit-mysangle'
        ss.dependency 'KSPlayer-mysangle/AVPlayer'
        ss.dependency 'KSPlayer-mysangle/Metal'
        ss.dependency 'KSPlayer-mysangle/Subtitle'
    end
  
    s.subspec 'Core' do |ss|
        ss.source_files = 'Sources/KSPlayer_mysangle/Core/*'
        ss.dependency 'KSPlayer-mysangle/AVPlayer'
    end

    s.subspec 'SwiftUI'do |ss|
        ss.source_files = 'Sources/KSPlayer_mysangle/SwiftUI/*.swift'
        ss.dependency 'KSPlayer-mysangle/AVPlayer'
    end

    s.subspec 'Audio'do |ss|
        ss.source_files = 'Sources/KSPlayer_mysangle/Audio/*.swift'
        ss.dependency 'KSPlayer-mysangle/Core'
    end
    s.subspec 'Video' do |ss|
        ss.source_files = 'Sources/KSPlayer_mysangle/Video/*.swift'
        ss.dependency 'KSPlayer-mysangle/Core'
        ss.dependency 'KSPlayer-mysangle/Subtitle'
    end
    #s.test_spec 'Tests' do |test_spec|
    #    test_spec.source_files = 'Tests/KSPlayerTests/*.swift'
    #    test_spec.resources = 'Tests/KSPlayerTests/Resources/*'
    #end    
end
