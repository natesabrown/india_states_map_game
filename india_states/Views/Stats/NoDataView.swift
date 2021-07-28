//
//  NoDataView.swift
//  india_states
//
//  Created by Nate Brown on 7/27/21.
//

import SwiftUI

struct NoDataView: View {
  var body: some View {
    VStack {
      Spacer()
      VStack {
        Text("🙅‍♀️")
          .font(.system(size: 70))
        Text("No data yet!")
          .font(.largeTitle)
          .bold()
        Text("Play the game first to see your statistics.")
          .font(.title3)
          .multilineTextAlignment(.center)
          .padding(.top)
      }
      .foregroundColor(.white)
      .padding()
      .padding(.horizontal)
      .background(
        LinearGradient(
          gradient: Gradient(colors: [Color.gray.opacity(0.5), Color.white.opacity(0.4), Color.gray.opacity(0.7)]),
          startPoint: .topLeading,
          endPoint: .bottomTrailing)
          .cornerRadius(30)
          .shadow(radius: 8)
      )
      ForEach(0..<3) { _ in
        Spacer()
      }
    }
  }
}

struct NoDataView_Previews: PreviewProvider {
  static var previews: some View {
    NoDataView()
      .defaultPreviewStyle(name: "Button as it would appear on stats page")
      .background(LinearGradient.statsPurple)
  }
}
