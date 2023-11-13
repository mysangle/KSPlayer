@testable import KSPlayer_mysangle
import XCTest
class KSMEPlayerTest: XCTestCase {
    func testPlaying() {
        if let path = Bundle(for: type(of: self)).path(forResource: "h264", ofType: "mp4") {
            let options = KSOptions()
            let player = KSMEPlayer(url: URL(fileURLWithPath: path), options: options)
            options.isAutoPlay = false
            player.delegate = self
            XCTAssertEqual(player.isPlaying, false)
            player.play()
            XCTAssertEqual(player.isPlaying, true)
            player.pause()
            XCTAssertEqual(player.isPlaying, false)
        }
    }

    func testAutoPlay() {
        if let path = Bundle(for: type(of: self)).path(forResource: "h264", ofType: "mp4") {
            let options = KSOptions()
            let player = KSMEPlayer(url: URL(fileURLWithPath: path), options: options)
            options.isAutoPlay = true
            player.delegate = self
            XCTAssertEqual(player.isPlaying, false)
            player.play()
            XCTAssertEqual(player.isPlaying, true)
            player.pause()
            XCTAssertEqual(player.isPlaying, false)
        }
    }
}

extension KSMEPlayerTest: MediaPlayerDelegate {
    func readyToPlay(player _: some KSPlayer_mysangle.MediaPlayerProtocol) {}

    func changeLoadState(player _: some KSPlayer_mysangle.MediaPlayerProtocol) {}

    func changeBuffering(player _: some KSPlayer_mysangle.MediaPlayerProtocol, progress _: Int) {}

    func playBack(player _: some KSPlayer_mysangle.MediaPlayerProtocol, loopCount _: Int) {}

    func finish(player _: some KSPlayer_mysangle.MediaPlayerProtocol, error _: Error?) {}
}
