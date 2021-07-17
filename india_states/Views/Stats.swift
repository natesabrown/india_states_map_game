//
//  Stats.swift
//  india_states
//
//  Created by Nate Brown on 7/16/21.
//

import SwiftUI

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

let dataGradient = LinearGradient(gradient: Gradient(colors: [.lightPurple, .purple, .darkPurple]), startPoint: .top, endPoint: .bottom)

struct StatePercent: Hashable {
  var name: String
  var percent: Int
}

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
    var percent = Int(((Double(dataState.correct) / Double((dataState.correct + dataState.incorrect))) * 100).rounded())
    let statePercent = StatePercent(name: name, percent: percent)
    //    print(statePercent)
    statePercents.append(statePercent)
  }
  return statePercents.sorted(by: { $0.percent > $1.percent } )
}

struct Stats: View {
  @State var statePercents = getStatePercents()
  @State var time = loadTime()
  
  init() {
    UINavigationBar.appearance().tintColor = .white
  }
  
  var body: some View {
    
    GeometryReader { geo in
      ScrollView(showsIndicators: false) {
        VStack(alignment: .leading) {
          if statePercents.count == 0 {
            Spacer()
            Text("No data yet! Please play the game first to see your statistics.")
              .foregroundColor(.white)
              .bold()
              .multilineTextAlignment(.center)
              .padding()
            Spacer()
          } else {
            Spacer()
              .frame(height: geo.size.height * 0.07)
            Text("Stats")
              .font(.largeTitle)
              .bold()
              .padding(.bottom)
            HStack {
              Text("\(Image(systemName: "clock")) Best Time:")
                .bold()
              Spacer()
              Text(getTimeString(startTime: Date(), endTime: Date().addingTimeInterval(Double(time))))
            }

            Text("States")
              .font(.title)
              .bold()
              .padding(.top)
            VStack(spacing: 10) {
              ForEach(statePercents, id: \.self) { statePercent in
                HStack {
                  Text(statePercent.name)
                    .font(.headline)
                  Spacer()
                  Text("\(statePercent.percent)%")
                }
              }
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.darkPurple.opacity(0.1), Color.clear]), startPoint: .top, endPoint: .bottom).cornerRadius(20))
            Spacer()
          }
        }
        .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(minHeight: geo.size.height)
      }
      .font(.title2)
      .padding()
      .foregroundColor(.white)
      .background(dataGradient.edgesIgnoringSafeArea(.all))
    }
    .edgesIgnoringSafeArea(.all)
    .onAppear {
      statePercents = getStatePercents()
      time = loadTime()
    }
  }
}

struct Stats_Previews: PreviewProvider {
  static var previews: some View {
    Stats()
  }
}
