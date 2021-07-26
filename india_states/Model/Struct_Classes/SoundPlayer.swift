//
//  SoundPlayer.swift
//  india_states
//
//  Created by Nate Brown on 7/25/21.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer?

struct Sound {
  var name: String
  var format: String
  
  static let finish = Sound(name: "finish", format: "wav")
  static let correct = Sound(name: "correct", format: "wav")
}

class SoundPlayer {
  static let shared = SoundPlayer()
  
  func playSound(of sound: Sound) {
    UserDefaults.standard.register(defaults: [SettingsKey.SOUND_ON: true])
    let shouldPlay = UserDefaults.standard.bool(forKey: SettingsKey.SOUND_ON)
    if !shouldPlay {
      return
    }
    
    guard let url = Bundle.main.url(forResource: sound.name, withExtension: sound.format) else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      player = try AVAudioPlayer(contentsOf: url)
      guard let player = player else { return }
      
      player.play()
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
}
