//
//  StateImage.swift
//  india_states
//
//  Created by Nate Brown on 7/30/21.
//

import SwiftUI

struct StateImage: View {
  var state: InState
  @Environment(\.openURL) var openURL
  
  var body: some View {
    VStack {
      Image(state.image.source)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxHeight: 250)
      
      Group {
        if state.image.attr != nil {
          Button(action: openLicensePage) {
            Text("Attribution: \(Text(state.image.attr!).bold()), Wikimedia Commons:  \(Text("License").bold())")
              .lineLimit(1)
              .minimumScaleFactor(0.5)
              .foregroundColor(Color(.systemGray))
          }
        } else {
          Text("Public Domain Image")
        }
      }
      .font(.caption)
      .foregroundColor(Color(.systemGray3))
    }
    .padding(.horizontal)
  }
  
  func openLicensePage() {
    guard let licenseURL = URL(string: state.image.license_type!.rawValue) else { return }
    openURL(licenseURL)
  }
}

struct StateImage_Previews: PreviewProvider {
  static var previews: some View {
    StateImage(state: STATES_UT.randomElement()!)
      .preferredColorScheme(.dark)
      .defaultPreviewStyle(name: "State Image & Attribution")
  }
}
