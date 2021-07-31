//
//  TimeView.swift
//  india_states
//
//  Created by Nate Brown on 7/25/21.
//

import SwiftUI

struct TimeView: View {
  @ObservedObject var time: GameTime
  @Binding var showSuccess: Bool
  @State var startTime = Date()
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    Text(time.timeString())
      .fontWeight(.black)
      .font(.system(.title2, design: .monospaced))
      .onReceive(timer) { _ in
        if showSuccess != true {
          time.time = time.time.addingTimeInterval(1)
        }
      }
  }
}

struct TimeView_Previews: PreviewProvider {
  static var previews: some View {
    TimeView(time: GameTime(), showSuccess: .constant(true))
  }
}
