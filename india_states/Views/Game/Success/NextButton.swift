//
//  NextButton.swift
//  india_states
//
//  Created by Nate Brown on 7/30/21.
//

import SwiftUI

struct NextButton: View {
  @Environment(\.isPreview) var isPreview
  
  var body: some View {
    Text("Next")
      .font(.title2)
      .foregroundColor(.white)
      .padding()
      .padding(.horizontal)
      .background(
        RoundedRectangle(cornerRadius: 20)
          .fill(Color.green)
          .shadow(radius: 5) )
      .padding()
      .padding(.bottom, isPreview ? 0 : UIApplication.shared.windows.first!.safeAreaInsets.bottom)
  }
}

struct NextButton_Previews: PreviewProvider {
  static var previews: some View {
    NextButton()
      .defaultPreviewStyle(name: "Next Button")
  }
}
