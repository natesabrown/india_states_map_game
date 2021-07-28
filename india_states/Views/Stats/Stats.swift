//
//  Stats.swift
//  india_states
//
//  Created by Nate Brown on 7/16/21.
//

import SwiftUI

struct Stats: View {
  @State var statePercents = DataStore.shared.getStatePercents()
  @State var bestTime = DataStore.shared.loadTime()
  
  var body: some View {
    let totalPercent = String("\(DataStore.shared.getTotalPercent())%")
    let timeString = getTimeString(startTime: Date(), endTime: Date().addingTimeInterval(Double(bestTime)))
    let noStateData = statePercents.count == 0
    
    VStack {
      VStack(alignment: .leading) {
        if noStateData {
          NoDataView()
        } else {
          
          if Bool(.isMac) {
            Text("Stats")
              .font(.largeTitle)
              .bold()
              .padding(.bottom)
          }
          
          DataElement(
            text: Text("\(Image(systemName: "clock")) Best Time:"),
            result: timeString)
          
          Text("States")
            .font(.title)
            .bold()
            .padding(.top)
          Divider()
          ScrollView {
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
          }
          .if(.isIpad) { view in
            view.frame(maxHeight: 400)
          }
          .background(
            LinearGradient(
              gradient: Gradient(colors: [Color.darkPurple.opacity(0.1), Color.lightPurple.opacity(0.5)]),
              startPoint: .top,
              endPoint: .bottom)
              .cornerRadius(20)
          )
          .shadow(radius: 4)
          
          DataElement(text: Text("Total"), result: totalPercent)
            .padding(.horizontal)
            .padding(.bottom)
          
        }
        Spacer()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .if(.isMac) { view in
        view.frame(maxWidth: 1000, maxHeight: 1000)
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .font(.title2)
    .padding()
    .foregroundColor(.white)
    .background(
      LinearGradient.statsPurple
        .edgesIgnoringSafeArea(.all))
    .navigationBarTitle(!.isMac ? "Stats" : "")
    .navigationBarHidden(false)
    .onAppear {
      setNavStyle()
      resetValues()
    }
  }
  
  func setNavStyle() {
    UINavigationBar.appearance().tintColor = .white
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
  }
  /// so that we don't have to do any fancy state management, we can just ensure this view is up-to-date when it's shown as a separate view
  func resetValues() {
    statePercents = DataStore.shared.getStatePercents()
    bestTime = DataStore.shared.loadTime()
  }
}

fileprivate struct DataElement: View {
  var text: Text
  var result: String
  
  var body: some View {
    HStack {
      text
        .bold()
      Spacer()
      Text(result)
    }
  }
}

struct Stats_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationView {
        Stats()
      }
      Stats()
        .previewDevice("iPad Pro (11-inch) (3rd generation)")
    }
  }
}
