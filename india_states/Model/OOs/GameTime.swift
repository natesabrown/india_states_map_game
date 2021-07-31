//
//  GameTime.swift
//  india_states
//
//  Created by Nate Brown on 7/25/21.
//

import Foundation

func getTimeString(startTime: Date, endTime: Date) -> String {
  let seconds = endTime.timeIntervalSince(startTime)
  if seconds > 3600 {
    return "59:59"
  }
  if seconds <= 0 {
    return "0:00"
  }
  let minutes = Int(floor(seconds / 60))
  let endSeconds = Int(Int(seconds) - (minutes * 60))
  let secondsString = endSeconds < 10 ? "0\(endSeconds)" : String(endSeconds)
  return "\(minutes):\(secondsString)"
}

class GameTime: ObservableObject {
  @Published var time: Date = Date()
  @Published var startTime: Date = Date()
  
  func resetTime() {
    startTime = Date()
    time = Date()
  }
  func timeString() -> String {
    return getTimeString(startTime: startTime, endTime: time)
  }
}
