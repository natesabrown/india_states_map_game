//
//  ContentView.swift
//  india_states
//
//  Created by Nate Brown on 7/14/21.
//

import SwiftUI
import AVKit

struct ContentView: View {
  @ObservedObject var time = Time()
  
    var body: some View {
      Entry()
        .environmentObject(time)
        .onAppear {
          do {
              try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
              try AVAudioSession.sharedInstance().setActive(true)
          } catch let error {
              print(error.localizedDescription)
          }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
