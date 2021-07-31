//
//  DataStore.swift
//  india_states
//
//  Created by Nate Brown on 7/27/21.
//

import Foundation

class DataStore {
  static let shared = DataStore()
  
  func getStatePercents() -> [StatePercent] {
    let stateData = loadStateData()
    if stateData.count == 0 {
      return []
    }
    var statePercents: [StatePercent] = []
    for dataState in stateData {
      var name = ""
      for state in STATES_UT {
        if state.img_id == dataState.img_id {
          name = state.name
        }
      }
      let percent = Int(((Double(dataState.correct) / Double((dataState.correct + dataState.incorrect))) * 100).rounded())
      let statePercent = StatePercent(name: name, percent: percent)
      //    print(statePercent)
      statePercents.append(statePercent)
    }
    return statePercents.sorted(by: { $0.percent > $1.percent } )
  }
  
  func getTotalPercent() -> Int {
    let stateData = loadStateData()
    if stateData.count == 0 {
      return 0
    }
    var totalCorrect = 0
    var totalWrong = 0
    for state in stateData {
      totalCorrect += state.correct
      totalWrong += state.incorrect
    }
    let ratio = Double(totalCorrect) / Double((totalCorrect + totalWrong))
    let percent = ratio * 100
    return Int(percent.rounded())
  }
  
  func loadStateData() -> [StateData] {
    var stateDatas: [StateData] = []
    for state in STATES_UT {
      if let data = UserDefaults.standard.value(forKey: "\(state.img_id)_data") as? Data {
        if let stateData = try? PropertyListDecoder().decode(StateData.self, from: data) {
          stateDatas.append(stateData)
          //        print(stateData)
        }
      }
    }
    return stateDatas
  }
  
  func loadTime() -> Int {
    let bestTime = UserDefaults.standard.integer(forKey: SettingsKey.BEST_TIME)
    //  print(bestTime)
    return bestTime
  }
  
  func setBestTime(time: GameTime) {
    let currentTime = Int(time.time.timeIntervalSince(time.startTime))
    let previousTime = UserDefaults.standard.integer(forKey: SettingsKey.BEST_TIME)
    if previousTime == 0 {
      UserDefaults.standard.setValue(currentTime, forKey: SettingsKey.BEST_TIME)
    } else {
      if currentTime < previousTime {
        UserDefaults.standard.setValue(currentTime, forKey: SettingsKey.BEST_TIME)
      }
    }
  }
  
  func setStateData(for state: InState, rightOnFirstTry: Bool) {
    var stateData: StateData? = nil
    if let data = UserDefaults.standard.value(forKey: "\(state.img_id)_data") as? Data {
      stateData = try? PropertyListDecoder().decode(StateData.self, from: data) }
    if stateData == nil {
      stateData = StateData(img_id: state.img_id, correct: 0, incorrect: 0)
    }
    guard var stateData = stateData else { return }
    
    if rightOnFirstTry { stateData.correct += 1 } else { stateData.incorrect += 1 }
    
    UserDefaults.standard.setValue(try? PropertyListEncoder().encode(stateData), forKey: "\(state.img_id)_data")
  }
}
