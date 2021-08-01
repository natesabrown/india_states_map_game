//
//  Entry.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI

struct Entry: View {
  @State var showSettings = false
  @State var showStatsSheet = false
  
  var body: some View {
    GeometryReader { geo in
      NavigationView {
        ZStack {
          Color.black.opacity(0.8)
          IndiaMontagePlayer()
          VStack {
            Spacer()
            IndiaFlag(viewWidth: geo.size.width)
            EntryText()
            Spacer()
            VStack(spacing: 20) {
              NavigationLink(destination: Game()) { PlayButton() }
              if !.isMac {
                NavigationLink(destination: Stats()) { StatsButton() }
              } else {
                Button(action: { showStatsSheet = true }) { StatsButton() }
              }
            }
            Spacer()
          }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea([.top, .bottom])
        .overlay(SettingsButton(onButtonPress: { showSettings = true }))
        .statusBarStyle(.lightContent)
      }
      .navigationViewStyle(StackNavigationViewStyle())
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .sheet(isPresented: $showSettings) { Settings() }
      .sheet(isPresented: $showStatsSheet) { Stats() }
    }
  }
}

struct IndiaFlag: View {
  var viewWidth: CGFloat
  
  var body: some View {
    Image("india_flag")
      .resizable()
      .aspectRatio(contentMode: .fit)
      .if(.isPhone) { view in view.frame(width: viewWidth * 0.6) }
      .if(.isIpad || .isMac) { view in view.frame(maxWidth: 300) }
  }
}

struct EntryText: View {
  var body: some View {
    Text("India States")
      .bold()
      .font(.system(size: 100))
      .lineLimit(1)
      .minimumScaleFactor(0.1)
      .foregroundColor(.indiaOrange)
      .padding(.horizontal)
    Text("& Union Territories")
      .font(.title3)
      .foregroundColor(.white)
      .shadow(radius: 2)
      .padding(.top, -16)
    Text("Map Game")
      .bold()
      .font(.largeTitle)
      .foregroundColor(.green)
      .padding(.top, 5)
  }
}

struct SettingsButton: View {
  var onButtonPress: (() -> Void) = { }
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        Button(action: onButtonPress) {
          Image(systemName: "gearshape.fill")
            .font(.system(size: 35))
            .foregroundColor(Color.white)
            .brightness(-0.2)
            .padding() } }
      Spacer()
    }
  }
}

struct PlayButton: View {
  var body: some View {
    Text("\(Image(systemName: "play.fill")) Play")
      .font(.title)
      .padding(30)
      .background(
        Image("buttonback")
          .resizable()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
      )
  }
}

struct StatsButton: View {
  var body: some View {
    Text("\(Image(systemName: "chart.bar.fill")) Stats")
      .font(.title)
      .foregroundColor(.white)
      .shadow(radius: 4)
  }
}

struct Entry_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Entry()
      
      Entry()
        .previewDevice("iPad Pro (11-inch) (3rd generation)")
      
      Entry()
        .previewDevice("Mac Catalyst")
    }
  }
}
