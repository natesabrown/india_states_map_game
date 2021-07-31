//
//  PositiveMessage.swift
//  india_states
//
//  Created by Nate Brown on 7/30/21.
//

import SwiftUI

let GOOD_RESPONSES = ["Correct!", "Great Job!", "Spot On!", "Correctamundo!", "Awesome!"]
struct PositiveMessage: View {
  @State var goodResponse = GOOD_RESPONSES.randomElement()!
  
  var body: some View {
    VStack {
      Image(systemName: "checkmark.seal.fill")
        .resizable()
        .frame(width: 50, height: 50)
      Text(goodResponse)
        .font(.title)
        .bold()
    }
    .padding(.vertical)
    .foregroundColor(.green)
  }
}

struct PositiveMessage_Previews: PreviewProvider {
  static var previews: some View {
    PositiveMessage()
      .defaultPreviewStyle(name: "Positive Message")
  }
}
