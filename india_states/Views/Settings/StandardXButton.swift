//
//  StandardXButton.swift
//  india_states
//
//  Created by Nate Brown on 7/30/21.
//

import SwiftUI

struct StandardXButton: View {
  var body: some View {
    Image(systemName: "multiply.circle.fill")
      .foregroundColor(.gray)
      .font(.title)
  }
}

struct StandardXButton_Previews: PreviewProvider {
  static var previews: some View {
    StandardXButton()
  }
}
