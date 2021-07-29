//
//  Game.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI

struct Game: View {
  @State var stateCollection = InState.generateStatesList()
  @State var stateIndex = 0
  @State var currentState = STATES_UT[0]
  @State var showSuccess = false
  @State var tryList: [Int] = [0,0,0,0]
  @State var successSelection = 0
  @State var hideAnswers = false
  @State var showExitAlert = false
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @StateObject var time = Time()
  
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
                    showExitAlert = true
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
                  TimeView(time: time, showSuccess: $showSuccess)
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
              AnswersView(stateIndex: $stateIndex, stateCollection: $stateCollection, tryList: $tryList, updateData: self.updateData, onSuccess: {
                SoundPlayer.shared.playSound(of: .correct)
                withAnimation {
                  showSuccess = true
                }
                if (stateIndex + 1) == stateCollection.count {
                  updateData()
                }
              })
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
                        SoundPlayer.shared.playSound(of: .finish)
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
                  Done(time: time, tryList: $tryList, onRestart: {
                    resetEverything()
                  }, onDone: {
                    resetEverything()
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
      print("I'm hear!")
    }
    .onDisappear {
      resetEverything(animated: false)
    }
    .onChange(of: stateIndex) { newIndex in
      currentState = stateCollection[newIndex]
    }
    .navigationBarTitle("")
    .navigationBarHidden(true)
    .alert(isPresented: $showExitAlert) { () -> Alert in
      let primaryButton = Alert.Button.default(Text("OK")) {
        presentationMode.wrappedValue.dismiss()
      }
      return Alert(
        title: Text("Exit?"),
        message: Text("If you exit, you will lose all progress for this session."),
        primaryButton: primaryButton,
        secondaryButton: .cancel())
    }
    .onChange(of: stateCollection) { _ in
      print("I am being changed!")
    }
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
  
  func resetEverything(animated: Bool = true) {
    if animated {
      withAnimation(.easeInOut(duration: 0.5)) {
        hideAnswers = true
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        resetCore()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
          withAnimation {
            hideAnswers = false
          }
        }
      }
    } else {
      resetCore()
    }
  }
  func resetCore() {
    stateCollection = InState.generateStatesList()
    stateIndex = 0
    currentState = stateCollection[0]
    showSuccess = false
    tryList = [0,0,0,0]
    successSelection = 0
    time.resetTime()
  }
}

struct AnswersView: View, Equatable {
  @Binding var stateIndex: Int
  @Binding var stateCollection: [InState]
  @Binding var tryList: [Int]
  var updateData: (() -> Void)
  var onSuccess: (() -> Void)
  
  var body: some View {
    TabView(selection: $stateIndex) {
      ForEach(Array(stateCollection.enumerated()), id: \.offset) { index, state in
        Answer(state: state, tryList: $tryList, onSuccess: onSuccess)
        .simultaneousGesture(DragGesture())
        .tag(index)
        .frame(maxWidth: 800)
          .padding(.bottom)
      }
    }
  }
  
  static func == (lhs: Self, rhs: Self) -> Bool {
    let check = (lhs.stateCollection == rhs.stateCollection) 
    return check
  }
}

struct Game_Previews: PreviewProvider {
  static var previews: some View {
    Game()
      .environmentObject(Time())
  }
}
