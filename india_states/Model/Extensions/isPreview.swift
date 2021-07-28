//
//  EnvironmentValues.swift
//  india_states
//
//  Created by Nate Brown on 7/27/21.
//

import SwiftUI

/// https://zacwhite.com/2020/detecting-swiftui-previews/
public extension EnvironmentValues {
  var isPreview: Bool {
    #if DEBUG
    return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    #else
    return false
    #endif
  }
}
