//
//  String.swift
//  india_states
//
//  Created by Nate Brown on 7/25/21.
//

import Foundation

/// https://stackoverflow.com/questions/42913672/remove-substring-between-parentheses
extension String {
  private func regExprOfDetectingStringsBetween(str1: String, str2: String) -> String {
    return "(?:\(str1))(.*?)(?:\(str2))"
  }
  
  func replacingOccurrences(from subString1: String, to subString2: String, with replacement: String) -> String {
    let regExpr = regExprOfDetectingStringsBetween(str1: subString1, str2: subString2)
    return replacingOccurrences(of: regExpr, with: replacement, options: .regularExpression)
  }
}
