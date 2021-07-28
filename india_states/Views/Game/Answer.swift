//
//  SwiftUIView.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI

let RR_RAD: CGFloat = 12

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

struct Answer: View {
  var state: InState
  @State var choiceList: [InState] = []
  @State var answeredList: [InState] = []
  @State var answerCorrect = false
  @Binding var tryList: [Int]
  var onSuccess: (() -> Void)?
  
  var body: some View {
    VStack {
      ForEach(choiceList.count != 0 ? [choiceList[0...1], choiceList[2...3]] : [], id: \.self) { choiceCollection in
        AnswerRow(choiceCollection: choiceCollection, answeredList: $answeredList, state: state, answerCorrect: $answerCorrect, tryList: $tryList, onSuccess: onSuccess)
      }
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .onChange(of: state) { _ in
      choiceList = getOptions(for: state)
    }
    .onAppear {
      choiceList = getOptions(for: state)
    }
    .onDisappear {
      answeredList = []
    }
  }
}

let successAnimation: Animation = .easeInOut(duration: 0.5)

struct AnswerRow: View {
  var choiceCollection: Array<InState>.SubSequence
  @Binding var answeredList: [InState]
  var state: InState
//  @State var maxHeight: CGFloat = 0
  @Binding var answerCorrect: Bool
  @Binding var tryList: [Int]
  var onSuccess: (() -> Void)?
  
  var body: some View {
    HStack {
      ForEach(choiceCollection, id: \.self) { choice in
        let disabled = answeredList.contains(choice)
        let correctAnsweredButton = (choice == state) && answerCorrect
//        let color = correctAnsweredButton ? Color.green : Color.red
        let color = Color.indiaGreen
        
        Button(action: {
          if choice == state {
            answerCorrect = true
            if onSuccess != nil {
              onSuccess!()
            }
            var stateData: StateData? = nil
            if let data = UserDefaults.standard.value(forKey: "\(state.img_id)_data") as? Data {
              stateData = try? PropertyListDecoder().decode(StateData.self, from: data)
            }
            if stateData == nil {
              stateData = StateData(img_id: state.img_id, correct: 0, incorrect: 0)
            }
            if answeredList.count == 0 {
              stateData!.correct = stateData!.correct + 1
            } else {
              stateData!.incorrect = stateData!.incorrect + 1
            }
            UserDefaults.standard.setValue(try? PropertyListEncoder().encode(stateData), forKey: "\(state.img_id)_data")
            
            tryList[answeredList.count] = tryList[answeredList.count] + 1
          } else {
            answeredList = answeredList + [choice]
          }
        }) {
          Text(choice.name)
            .bold()
            .lineLimit(3)
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
        .opacity(disabled ? 0.5 : 1.0)
        .disabled(disabled)
        .animation(.easeInOut)
      }
    }
  }
}

struct Answer_Previews: PreviewProvider {
  static var previews: some View {
    Answer(state: MADHYA_PRADESH, tryList: .constant([0,0,0,0]))
  }
}
