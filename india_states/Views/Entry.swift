//
//  Entry.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI

struct Entry: View {
  
  var body: some View {
    GeometryReader { geo in
      NavigationView {
        ZStack {
          Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)
          PlayerView(source: "india_montage")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .brightness(-0.3)
          VStack {
            Spacer()
            Image("india_flag")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: geo.size.width * 0.6)
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
            Spacer()
            VStack(spacing: 20) {
              NavigationLink(destination: Game()) {
                Text("\(Image(systemName: "play.fill")) Play")
                  .font(.title)
                  .padding(30)
                  .background(
                    Image("buttonback")
                      .resizable()
                      .frame(maxWidth: .infinity, maxHeight: .infinity)
                  )
              }
              NavigationLink(destination: Stats()) {
                Text("\(Image(systemName: "chart.bar.fill")) Stats")
                  .font(.title)
                  .foregroundColor(.white)
                  .shadow(radius: 4)
              }
            }
            Spacer()
          }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea([.top, .bottom])
      }
      .navigationViewStyle(StackNavigationViewStyle())
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
}

struct Entry_Previews: PreviewProvider {
  static var previews: some View {
    Entry()
  }
}
