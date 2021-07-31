//
//  Game.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI

struct Game: View {
  /// the order of states in which the user will play this quiz. it resets every time you play the game!
  @State var stateCollection = InState.generateStatesList(testing: true)
  /// the current "index" at the stateCollection that the user is at in the game
  @State var stateIndex = 0
  /// holds the current state the user is looking at
  @State var currentState = STATES_UT[0]
  /// how many answers the user got right after the 1st, 2nd, etc. try
  @State var tryList: [Int] = [0,0,0,0]
  /// whether basic success view, done view is shown on the overlayed tab
  @State var successSelection = 0
  /// handles data & functions for the timer shown on the bottom left of the map
  @StateObject var time = GameTime()
  
  /// Variables that perform basic UI functions:
  @State var showSuccess = false
  @State var hideAnswers = false
  @State var showExitAlert = false
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    GeometryReader { geo in
      VStack {
        
        WebViewController(state: $currentState)
          /// fix the map shaking problem caused by the mac topbar
          .if (!.isMac) { view in
            view.edgesIgnoringSafeArea(.all)
          }
          .overlay(
            VStack {
              HStack {
                Button(action: { showExitAlert = true }) {
                  Image("backbutton")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.indiaOrange) }
                Spacer()
                Button(action: { resetEverything() }) {
                  Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(Color.indiaGreen)
                }
              }
              Spacer()
              HStack {
                Text("\(stateIndex + 1)/\(stateCollection.count)")
                  .fontWeight(.black)
                  .font(.title2)
                Spacer()
                TimeView(time: time, showSuccess: $showSuccess)
              }
              .foregroundColor(Color.indiaGreen)
            }
            .padding()
          )
        
        VStack {
          Image("topbar")
            .resizable()
            .frame(height: 20)
            .frame(maxWidth: .infinity)
            .shadow(radius: 10)
            .offset(y: -12)
          if hideAnswers { Spacer() } else {
            AnswerTabContent(
              stateIndex: $stateIndex,
              stateCollection: $stateCollection,
              tryList: $tryList,
              onSuccess: onRightAnswerPressed)
          }
        }
        .background(WoodyBackground())
        .frame(height: geo.size.height * 0.3)
      }
      
      if showSuccess {
        GeometryReader { geo in
          ScrollView {
            ZStack {
              Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
              TabView(selection: $successSelection) {
                Success(state: $currentState, onButtonPress: onSuccessDone)
                  .simultaneousGesture(DragGesture())
                  .tag(0)
                Done(
                  time: time,
                  tryList: $tryList,
                  onRestart: { resetEverything() },
                  onDone: { presentationMode.wrappedValue.dismiss() })
                  .simultaneousGesture(DragGesture())
                  .tag(1)
              }
              .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
              .frame(width: geo.size.width, height: geo.size.height)
            }
          }
        }
        .edgesIgnoringSafeArea(.all)
        .statusBarStyle(.lightContent)
      }
    }
    .onAppear { setStatusStyle() }
    .onAppear { resetEverything(animated: false) }
    .onDisappear { resetEverything(animated: false) }
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
  }
  
  func onRightAnswerPressed() {
    SoundPlayer.shared.playSound(of: .correct)
    withAnimation {
      showSuccess = true
    }
    if (stateIndex + 1) == stateCollection.count {
      DataStore.shared.setBestTime(time: time)
    }
  }
  
  func onSuccessDone() {
    setStatusStyle()
    let finalStateCompleted = (stateIndex + 1) == stateCollection.count
    withAnimation {
      if finalStateCompleted {
        successSelection = 1
        SoundPlayer.shared.playSound(of: .finish)
      } else {
        stateIndex += 1
        showSuccess = false
      }
    }
  }
  
  func setStatusStyle() {
    UIApplication.statusBarStyleHierarchy.append(.darkContent)
    UIApplication.setStatusBarStyle(.darkContent)
  }
  
  func resetEverything(animated: Bool = true) {
    /// animated allows the view to completely reset so there are no access errors with different mapping methods
    if animated {
      withAnimation(.easeInOut(duration: 0.5)) { hideAnswers = true }
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        resetCore()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
          withAnimation { hideAnswers = false }
        }
      }
    } else { resetCore() }
    
    func resetCore() {
      stateCollection = InState.generateStatesList(testing: true)
      stateIndex = 0
      currentState = stateCollection[0]
      showSuccess = false
      tryList = [0,0,0,0]
      successSelection = 0
      time.resetTime()
    }
    
  }
}

struct WoodyBackground: View {
  var body: some View {
    ZStack {
      Image("wood")
        .resizable()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .opacity(0.5)
        .blur(radius: 0.4)
        .zIndex(1)
      Color.indiaOrange
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct Game_Previews: PreviewProvider {
  static var previews: some View {
    Game()
  }
}
