
/// Code for the looping view primarily obtained from https://schwiftyui.com/swiftui/playing-videos-on-a-loop-in-swiftui/

import SwiftUI
import AVKit
import AVFoundation

/// Infinite-playing montage on the entry screen of the app
struct LoopingPlayerView: UIViewRepresentable {
  /// source of the video meant to be played
  var source: String
  /// type of the video meant to be played
  var fileType: String = "mp4"
  
  func updateUIView(_ uiView: LoopingPlayerUIView, context: UIViewRepresentableContext<LoopingPlayerView>) {
    /// when the view updates, make sure the player continues to play the video (meant to fix the bug with the video stopping on certain exits)
    uiView.playerLayer.player?.play()
  }
  
  func makeUIView(context: Context) -> LoopingPlayerUIView {
    return LoopingPlayerUIView(frame: .zero, source: source, fileType: fileType)
  }
}


class LoopingPlayerUIView: UIView {
  let playerLayer = AVPlayerLayer()
  private var playerLooper: AVPlayerLooper?
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(frame: CGRect, source: String, fileType: String) {
    super.init(frame: frame)
    
    // Load the resource
    let fileUrl = Bundle.main.url(forResource: source, withExtension: fileType)!
    let asset = AVAsset(url: fileUrl)
    let item = AVPlayerItem(asset: asset)
    
    // Setup the player
    let player = AVQueuePlayer()
    playerLayer.player = player
    playerLayer.videoGravity = .resizeAspectFill
    layer.addSublayer(playerLayer)
    
    // Create a new player looper with the queue player and template item
    playerLooper = AVPlayerLooper(player: player, templateItem: item)
    
    // Start the movie
    player.play()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    playerLayer.frame = bounds
  }
}

struct IndiaMontagePlayer: View {
  var body: some View {
    LoopingPlayerView(source: "india_montage")
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .edgesIgnoringSafeArea(.all)
      .brightness(-0.3)
  }
}

// Note: preview only works correctly when played
struct LoopingPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    IndiaMontagePlayer()
      .previewDisplayName("Full-Screen Infinite Video")
  }
}
