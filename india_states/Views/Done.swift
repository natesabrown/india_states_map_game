//
//  Done.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI

let BAR_COLORS: [Color] = [.indiaBlue, .indiaOrange, .indiaGreen, .purple]

struct Done: View {
  @EnvironmentObject var time: Time
  @Binding var tryList: [Int]
//  @Binding var time: String
  var onRestart: (() -> Void)?
  var onDone: (() -> Void)?
  
  var body: some View {
    VStack {
      Text("Done!")
        .font(.largeTitle)
        .bold()
        .scaleEffect(1.2)
      Text("\(Image(systemName: "clock.fill")) \(time.timeString())")
        .font(.title)
        .padding(.top, 4)
        .padding(.bottom)
      VStack(spacing: 10) {
        ForEach(Array(["1st", "2nd", "3rd", "4th"].enumerated()), id: \.offset) { index, text in
          DoneBar(text: text, index: index, tryList: $tryList)
        }
      }
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
    }
    .padding()
    .multilineTextAlignment(.center)
    .foregroundColor(.white)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

struct DoneBar: View {
  @State var shown = false
  var text: String
  var index: Int
  @Binding var tryList: [Int]
  
  var body: some View {
    let correctFrac = getCorrectFrac()
    
    SingleAxisGeometryReader { width in
      VStack(alignment: .leading) {
        HStack {
          Text("\(text) Try:")
            .font(.title2)
            .fontWeight(.bold)
          Spacer()
          Text("\(Int(round(correctFrac * 100)))%")
            .font(.title2)
        }
        let barWidth = correctFrac < 0.05 ? 5 : width * CGFloat(correctFrac)
        Rectangle()
          .fill(BAR_COLORS[index])
          .frame(height: 40)
          .frame(maxWidth: shown ? barWidth : 0)
          .animation(.easeInOut(duration: 2))
          .onAppear {
            shown = true
          }
      }
    }
  }
  
  func calcTotalTry() -> Int {
    var totalTry = 0
    for thing in tryList {
      totalTry += thing
    }
    return totalTry
  }
  func getCorrectFrac() -> Double {
    var correctFrac = (Double(tryList[index]) / Double(calcTotalTry()))
    correctFrac = correctFrac.isNaN ? 0.0 : correctFrac
    return correctFrac
  }
}

struct Done_Previews: PreviewProvider {
  static var previews: some View {
    Done(tryList: .constant([1, 2, 3, 4]))
  }
}
