//
//  Done.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI

struct Done: View {
  @EnvironmentObject var time: Time
  @Binding var tryList: [Int]
//  @Binding var time: String
  var onRestart: (() -> Void)?
  var onDone: (() -> Void)?
  
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
        Button(action: {
          if onRestart != nil {
            onRestart!()
          }
        }) {
          Text("\(Image(systemName: "arrow.clockwise.circle.fill")) Restart")
            .font(.title2)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 20).strokeBorder(style: StrokeStyle(lineWidth: 5)))
        }
        Button(action: {
          if onDone != nil {
            onDone!()
          }
        }) {
          Text("\(Image(systemName: "checkmark.circle.fill")) Done")
            .font(.title2)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.green))
        }
      }
      .padding()
      .padding(.horizontal)
      .padding(.horizontal)
      Spacer()
    }
    .padding()
    .multilineTextAlignment(.center)
    .foregroundColor(.white)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

struct Done_Previews: PreviewProvider {
  static var previews: some View {
    Done(tryList: .constant([1, 2, 3, 4]))
      .environmentObject(Time())
      .darkBackground()
  }
}
