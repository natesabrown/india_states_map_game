//
//  Done.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI

struct Done: View {
  @ObservedObject var time: GameTime
  @Binding var tryList: [Int]
  var onRestart: (() -> Void)?
  var onDone: (() -> Void)?
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {
    VStack {
      
      Spacer()
      
      Text("Done!")
        .font(.largeTitle)
        .bold()
        .scaleEffect(1.2)
      Text("\(Image(systemName: "clock.fill")) \(time.timeString())")
        .font(.title)
        .padding(.top, 4)
        .padding(.bottom)
      
      Spacer()
      
      VStack(spacing: 10) {
        ForEach(Array(["1st", "2nd", "3rd", "4th"].enumerated()), id: \.offset) { index, text in
          DoneBar(text: text, index: index, tryList: $tryList)
        }
      }
      
      Spacer()
      
      VStack(spacing: 10) {
        Button(action: { if onRestart != nil { onRestart!() } }) { RestartButton() }
        Button(action: { if onDone != nil { onDone!() } }) { DoneButton() } }
      .padding(.vertical)
      .padding(.horizontal, 50)
      .if (horizontalSizeClass == .regular) { view in
        view.frame(maxWidth: 350)
      }
      
      Spacer()
    }
    .padding()
    .multilineTextAlignment(.center)
    .foregroundColor(.white)
    .frame(
      maxWidth: (horizontalSizeClass == .regular ? 500 : .infinity),
      maxHeight: .infinity
    )
  }
}

struct RestartButton: View {
  var body: some View {
    Text("\(Image(systemName: "arrow.clockwise.circle.fill")) Restart")
      .font(.title2)
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .fixedSize(horizontal: false, vertical: true)
      .background(RoundedRectangle(cornerRadius: 20).strokeBorder(style: StrokeStyle(lineWidth: 5)))
  }
}

struct DoneButton: View {
  var body: some View {
    Text("\(Image(systemName: "checkmark.circle.fill")) Done")
      .font(.title2)
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .fixedSize(horizontal: false, vertical: true)
      .background(RoundedRectangle(cornerRadius: 20).fill(Color.green))
  }
}

struct Done_Previews: PreviewProvider {
  
  static var previews: some View {
    let populatedDone = VStack {
      Done(
        time: GameTime(),
        tryList: .constant([1, 2, 3, 4]))
    }
    .frame(maxWidth: .infinity)
    .darkBackground()
    
    Group {
      populatedDone
      
      populatedDone
        .previewDevice("iPad Pro (11-inch) (3rd generation)")
      
      populatedDone
        .previewDevice("Mac Catalyst")
    }
  }
}
