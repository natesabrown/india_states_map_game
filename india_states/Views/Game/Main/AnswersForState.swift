//
//  SwiftUIView.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI

struct AnswersForState: View {
  var state: InState
  @State var choiceList: [InState] = []
  @State var answeredList: [InState] = []
  @Binding var tryList: [Int]
  var onSuccess: (() -> Void)?
  
  var body: some View {
    VStack {
      ForEach(choiceList.count != 0 ? [choiceList[0...1], choiceList[2...3]] : [], id: \.self) { choiceCollection in
        HStack {
          ForEach(choiceCollection, id: \.self) { choice in
            let disabled = answeredList.contains(choice)
            
            Button(action: { onButtonPress(choice: choice) }) { AnswerChoice(choice: choice) }
              .opacity(disabled ? 0.5 : 1.0)
              .disabled(disabled)
              .animation(.easeInOut)
          }
        }
      }
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .onAppear { setOptions() }
    .onChange(of: state) { _ in setOptions() }
    .onDisappear { answeredList = [] }
  }
  
  func onButtonPress(choice: InState) {
    let userChoseCorrect = choice == state
    if userChoseCorrect {
      /// call the function meant to be shown on success (i.e., show the "success" screen!)
      if let onSuccess = onSuccess { onSuccess() }
      /// update stored statistics for user data analysis
      let rightOnFirstTry = answeredList.count == 0
      DataStore.shared.setStateData(for: choice, rightOnFirstTry: rightOnFirstTry)
      /// update data store that will later show the percent user got 1st try, 2nd try etc.
      tryList[answeredList.count] += 1
    } else {
      answeredList = answeredList + [choice]
    }
  }
  
  func setOptions() {
    let options = getOptions(for: state)
    choiceList = options
  }
  
  func getOptions(for state: InState) -> [InState] {
    var returnList = [state]
    var states = STATES_UT
    states = states.filter { $0 != state }
    for _ in 0 ..< 3 {
      let newState = states.randomElement()!
      returnList.append(newState)
      states = states.filter { $0 != newState }
    }
    return returnList.shuffled()
  }
}

struct AnswerChoice: View {
  var choice: InState
  
  var body: some View {
    Text(choice.name)
      .bold()
      .lineLimit(3)
      .padding(1)
      .minimumScaleFactor(0.3)
      .foregroundColor(.indiaGreen)
      .font(.isIpad ? .title2 : Bool(.isMac) ? .title : .body)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .multilineTextAlignment(.center)
      .background(
        RoundedRectangle(cornerRadius: 14)
          .fill(Color.white)
          .shadow(radius: 6, y: 2)
          .animation(nil))
      .padding(3)
  }
}

struct Answer_Previews: PreviewProvider {
  static var previews: some View {
    let previewState = STATES_UT.randomElement()!
    
    Group {
      AnswersForState(state: MADHYA_PRADESH, tryList: .constant([0,0,0,0]))
        .frame(width: 500, height: 300)
        .padding()
        .defaultPreviewStyle()
      
      AnswerChoice(choice: previewState)
        .padding()
        .previewLayout(.fixed(width: 300, height: 120))
    }
  }
}
