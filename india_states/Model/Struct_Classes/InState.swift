//
//  State.swift
//  india_states
//
//  Created by Nate Brown on 7/14/21.
//

import Foundation

struct InState: Equatable, Hashable {
  let name: String
  let img_id: String
  
  let officialLangs: [IndiaLanguage]
  var secondLangs: [IndiaLanguage]?
  
  let image: InImage
  
  let capitals: (String, String?, String)
  var bordered: Bool = false
  
  static func generateStatesList(testing: Bool = false) -> [InState] {
    var states = STATES_UT
    var returnStates: [InState] = []
    let numStates = testing ? 5 : states.count
    for _ in 0 ..< numStates {
      let state = states.randomElement()!
      states = states.filter { $0 != state }
      returnStates.append(state)
    }
    return returnStates
  }
  
  static func == (lhs: InState, rhs: InState) -> Bool {
    lhs.img_id == rhs.img_id
  }
  func hash(into hasher: inout Hasher) {
    hasher.combine(img_id)
  }
}
