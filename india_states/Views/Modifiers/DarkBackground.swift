//
//  DarkBackground.swift
//  SunriseAlarm
//
//  Created by Nate Brown on 7/8/21.
//

import SwiftUI

struct DarkBackground: ViewModifier {
  func body(content: Content) -> some View {
    content
      .background(Color.black.opacity(0.8).edgesIgnoringSafeArea(.all))
  }
}

extension View {
  func darkBackground() -> some View {
    self.modifier(DarkBackground())
  }
}
