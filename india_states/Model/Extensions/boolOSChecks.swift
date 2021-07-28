//
//  boolOSChecks.swift
//  india_states
//
//  Created by Nate Brown on 7/27/21.
//

import UIKit

extension Bool {
  static var isIpad: Bool {
    get {
      return (UIDevice.current.userInterfaceIdiom == .pad) && !isMac
    }
  }
  static var isPhone: Bool {
    get {
      return UIDevice.current.userInterfaceIdiom == .phone
    }
  }
  static var isMac: Bool {
    get {
      #if targetEnvironment(macCatalyst)
      return true
      #else
      return false
      #endif
    }
  }
  static var isLargeDevice: Bool {
    get {
      return (UIDevice.current.userInterfaceIdiom == .pad)
    }
  }
}
