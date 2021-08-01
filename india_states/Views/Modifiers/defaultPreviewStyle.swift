//
//  defaultPreviewStyle.swift
//  india_states
//
//  Created by Nathaniel Brown on 8/1/21.
//

import SwiftUI

struct DefaultPreviewStyle: ViewModifier {
  var name: String?
  
  func body(content: Content) -> some View {
    content
      .padding()
      .previewLayout(.sizeThatFits)
      .previewDisplayName(name ?? "")
  }
}

extension View {
  func defaultPreviewStyle(name: String? = nil) -> some View {
    self.modifier(DefaultPreviewStyle(name: name))
  }
}
