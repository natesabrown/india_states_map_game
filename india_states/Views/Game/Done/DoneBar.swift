//
//  DoneBar.swift
//  india_states
//
//  Created by Nate Brown on 7/25/21.
//

import SwiftUI

let BAR_COLORS: [Color] = [.indiaBlue, .indiaOrange, .indiaGreen, .purple]

struct DoneBar: View {
  var text: String
  var index: Int
  @State var shown = false
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

struct DoneBar_Previews: PreviewProvider {
  static var previews: some View {
    DoneBar(text: "1st", index: 0, tryList: .constant([2, 4, 1, 3]))
      .defaultPreviewStyle()
      .foregroundColor(.white)
      .darkBackground()
  }
}
