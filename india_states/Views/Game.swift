//
//  Game.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI
import Introspect

func generateStatesList() -> [InState] {
  var states = STATES_UT
  var returnStates: [InState] = []
  for _ in 0 ..< 5 { // STATES_UT.count
    let state = states.randomElement()!
    states = states.filter { $0 != state }
    returnStates.append(state)
  }
  return returnStates
}

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

class Time: ObservableObject {
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

struct Game: View {
  @State var stateCollection = generateStatesList()
  @State var stateIndex = 0
  @State var currentState = STATES_UT[0]
  @State var showSuccess = false
  @State var tryList: [Int] = [0,0,0,0]
  @State var successSelection = 0
  @State var hideAnswers = false
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @EnvironmentObject var time: Time
  
  var body: some View {
    ZStack {
      GeometryReader { geo in
        VStack {
          WebViewController(state: $currentState)
            //            .offset(y: 16)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .overlay(
              VStack {
                HStack {
                  Button(action: {
                    presentationMode.wrappedValue.dismiss()
                  }) {
                    Image("backbutton")
                      .resizable()
                      .frame(width: 60, height: 60)
                      .foregroundColor(.indiaOrange)
                  }
                  Spacer()
                  Button(action: {
                    resetEverything()
                  }) {
                    Image(systemName: "arrow.triangle.2.circlepath")
                      .font(.system(size: 35, weight: .bold))
                      .foregroundColor(Color.indiaGreen)
                  }
                }
                .padding()
                Spacer()
                HStack {
                  Text("\(stateIndex + 1)/\(stateCollection.count)")
                    .fontWeight(.black)
                    .font(.title2)
                  //                    .shadow(radius: 3)
                  Spacer()
                  TimeView(showSuccess: $showSuccess)
                }
                .foregroundColor(Color.indiaGreen)
                .padding()
              }
            )
          VStack {
            Image("topbar")
              .resizable()
              .frame(height: 20)
              .frame(maxWidth: .infinity)
              .shadow(radius: 10)
              .offset(y: -12)
            if hideAnswers {
              Spacer()
            }
            if !hideAnswers {
              TabView(selection: $stateIndex) {
                ForEach(Array(stateCollection.enumerated()), id: \.offset) { index, state in
                  Answer(state: state, tryList: $tryList, onSuccess: {
                    withAnimation {
                      showSuccess = true
                    }
                    if (stateIndex + 1) == stateCollection.count {
                      updateData()
                    }
                  })
                  .simultaneousGesture(DragGesture())
                  .tag(index)
                }
              }
            }
          }
          .frame(maxHeight: .infinity)
          .background(ZStack {
            Image("wood")
              .resizable()
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .opacity(0.5)
              .blur(radius: 0.4)
              .zIndex(1)
            Color.indiaOrange
          }
          .edgesIgnoringSafeArea(.all)
          )
          .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
          .frame(height: geo.size.height * 0.3)
        }
        if showSuccess {
          GeometryReader { geo in
            ScrollView {
              TabView(selection: $successSelection) {
                ZStack {
                  Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
                  Success(state: $currentState, onButtonPress: {
                    withAnimation {
                      if (stateIndex + 1) == stateCollection.count {
                        withAnimation {
                          successSelection = 1
                        }
                      } else {
                        stateIndex += 1
                        showSuccess = false
                      }
                    }
                  })
                }
                .simultaneousGesture(DragGesture())
                .tag(0)
                ZStack {
                  Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
                  Done(tryList: $tryList, onRestart: {
                    resetEverything()
                  }, onDone: {
                    presentationMode.wrappedValue.dismiss()
                  })
                }
                .simultaneousGesture(DragGesture())
                .tag(1)
              }
              .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
              .frame(
                width: geo.size.width,
                height: geo.size.height
              )
            }
          }
          .edgesIgnoringSafeArea(.all)
        }
      }
    }
    .onAppear {
      currentState = stateCollection[stateIndex]
      time.resetTime()
    }
    .onDisappear {
      resetEverything()
    }
    .onChange(of: stateIndex) { newIndex in
      currentState = stateCollection[newIndex]
    }
    .navigationBarTitle("")
    .navigationBarHidden(true)
  }
  
  func updateData() {
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
  
  func resetEverything() {
    withAnimation(.easeInOut(duration: 0.5)) {
      hideAnswers = true
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      stateCollection = generateStatesList()
      stateIndex = 0
      currentState = stateCollection[0]
      showSuccess = false
      tryList = [0,0,0,0]
      successSelection = 0
      time.resetTime()
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        withAnimation {
          hideAnswers = false
        }
      }
    }
  }
}

struct TimeView: View {
  @Binding var showSuccess: Bool
  @State var startTime = Date()
  //  @State var time = Date()
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  @EnvironmentObject var time: Time
  
  var body: some View {
    Text(time.timeString())
      .fontWeight(.black)
      .font(.system(.title2, design: .monospaced))
      //      .shadow(radius: 3)
      .onReceive(timer) { _ in
        if showSuccess != true {
          time.time = time.time.addingTimeInterval(1)
        }
      }
  }
}

struct Game_Previews: PreviewProvider {
  static var previews: some View {
    Game()
      .environmentObject(Time())
  }
}
