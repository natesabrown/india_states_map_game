//
//  AnswerTabContent.swift
//  india_states
//
//  Created by Nate Brown on 7/30/21.
//

import SwiftUI

struct AnswerTabContent: View, Equatable {
  @Binding var stateIndex: Int
  @Binding var stateCollection: [InState]
  @Binding var tryList: [Int]
  var onSuccess: (() -> Void)
  
  var body: some View {
    TabView(selection: $stateIndex) {
      ForEach(Array(stateCollection.enumerated()), id: \.offset) { index, state in
        AnswersForState(state: state, tryList: $tryList, onSuccess: onSuccess)
          .simultaneousGesture(DragGesture())
          .tag(index)
          .frame(maxWidth: 800)
          .padding(.bottom)
      }
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
  }
  
  static func == (lhs: Self, rhs: Self) -> Bool {
    let check = (lhs.stateCollection == rhs.stateCollection)
    return check
  }
}

struct AnswerTabContent_Previews: PreviewProvider {
  static var previews: some View {
    AnswerTabContent(
      stateIndex: .constant(1),
      stateCollection: .constant([MADHYA_PRADESH, UTTARAKHAND]),
      tryList: .constant([1,2,3,4]),
      onSuccess: { }
    )
    .frame(width: 500, height: 250)
    .defaultPreviewStyle()
  }
}
