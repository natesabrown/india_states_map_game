//
//  Languages.swift
//  india_states
//
//  Created by Nate Brown on 7/30/21.
//

import SwiftUI

struct Languages: View {
  var state: InState
  
  var body: some View {
    VStack {
      Text("\(Image(systemName: "message.fill")) Languages")
        .font(.title3)
        .padding(.bottom, 5)
        .fixedSize(horizontal: false, vertical: true)
      Text("Official")
        .bold()
      LanguageView(langs: state.officialLangs)
      if state.secondLangs != nil {
        Text("Second")
          .bold()
        LanguageView(langs: state.secondLangs!)
      }
    }
    .padding(.horizontal, 70)
    .padding(.vertical)
  }
}

struct Languages_Previews: PreviewProvider {
  static var previews: some View {
    let previewState = STATES_UT.randomElement()!
    
    Languages(state: previewState)
      .preferredColorScheme(.dark)
      .defaultPreviewStyle(name: "Languages")
  }
}
