//
//  SwiftUIView.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI

struct Success: View {
  @Binding var state: InState
  var onButtonPress: (() -> Void)?
  @Environment(\.isPreview) var isPreview
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {
    GeometryReader { geo in
      VStack {
        ScrollView(showsIndicators: true) {
          ScrollViewReader { reader in
            Spacer().frame(height: geo.size.height * 0.05).id(0)
            VStack {
              PositiveMessage()
              Text(state.name)
                .font(.largeTitle)
                .bold()
                .padding(.top, -12)
                .padding(.bottom, -2)
              StateImage(state: state)
              CapitalView(state: state)
                .padding(.top)
              Languages(state: state)
                .onAppear { reader.scrollTo(0) }
            }
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom)
            .if(!isPreview) { view in
              view.padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top)
            }
          }
        }
        Button(action: { if onButtonPress != nil { onButtonPress!() } }) { NextButton() }
      }
      .if (horizontalSizeClass == .regular) { view in
        view.frame(maxWidth: 600)
      }
      .frame(maxWidth: .infinity)
    }
    .preferredColorScheme(.dark)
  }
}

struct Success_Previews: PreviewProvider {
  static var previews: some View {
    let previewState = STATES_UT.randomElement()!
    
    Group {
      Success(state: .constant(previewState))
      Success(state: .constant(previewState))
        .previewDevice("iPad Pro (11-inch) (3rd generation)")
      Success(state: .constant(previewState))
        .previewDevice("Mac Catalyst")
    }
    .darkBackground()
  }
}
