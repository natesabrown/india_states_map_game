/// https://schwiftyui.com/swiftui/playing-videos-on-a-loop-in-swiftui/

import SwiftUI
import AVKit
import AVFoundation

struct PlayerView: UIViewRepresentable {
  var source: String
  
  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
  }
  
  func makeUIView(context: Context) -> UIView {
    return LoopingPlayerUIView(frame: .zero, source: source)
  }
}


class LoopingPlayerUIView: UIView {
  private let playerLayer = AVPlayerLayer()
  private var playerLooper: AVPlayerLooper?
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(frame: CGRect, source: String) {
    super.init(frame: frame)
    
    // Load the resource
    let fileUrl = Bundle.main.url(forResource: source, withExtension: "mp4")!
    let asset = AVAsset(url: fileUrl)
    let item = AVPlayerItem(asset: asset)
    
    // Setup the player
    let player = AVQueuePlayer()
//    player.isMuted = true // this solution doesn't work
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
