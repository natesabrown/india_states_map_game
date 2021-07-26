//
//  Settings.swift
//  india_states
//
//  Created by Nate Brown on 7/26/21.
//

import SwiftUI
import ScreenCorners

struct Settings: View {
  var testing = false
  @AppStorage(SettingsKey.SOUND_ON) var soundOn: Bool = true
  @Environment(\.presentationMode) var presentationMode
  @Environment(\.openURL) var openURL
  @State var showRatingAlert = false
  @ScaledMetric var flagUp: CGFloat = 8
  
  var body: some View {
    let bundleIdentifier = Bundle.main.bundleIdentifier
    let reviewURLString = bundleIdentifier != nil ? "itms-apps://itunes.apple.com/app/\(bundleIdentifier)" : nil
    let reviewURL = (reviewURLString != nil) ? URL(string: reviewURLString!) : nil
    
    VStack {
      HStack {
        HStack(alignment: .bottom) {
          Text("Settings")
            .font(.largeTitle)
            .bold()
            .padding(.top)
          Image("india_flag")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 25)
            .padding(.bottom, flagUp)
        }
        Spacer()
        Button(action: {
          presentationMode.wrappedValue.dismiss()
        }) {
          VStack {
            Image(systemName: "multiply.circle.fill")
              .foregroundColor(.gray)
              .font(.title)
          }
        }
      }
      Toggle(isOn: $soundOn) {
        Text("Sound On \(Image(systemName: soundOn ? "speaker.fill" : "speaker.slash.fill"))")
      }
      .toggleStyle(SwitchToggleStyle(tint: .indiaBlue))
      .modifier(SettingsEl())
      .padding(.top)
      
      Spacer()
      
      VStack(spacing: 10) {
        Button(action: {
          if reviewURL != nil {
            openURL(reviewURL!)
          } else {
            showRatingAlert = true
          }
        }) {
          VStack(spacing: 2) {
            Text("Rate")
            HStack {
              ForEach(0..<5){ _ in
                Image(systemName: "star.fill")
              }
            }
          }
          .foregroundColor(.white)
          .padding()
          .frame(maxWidth: .infinity)
          .background(
            LinearGradient(gradient: Gradient(colors: [.red, .indiaOrange]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
              .cornerRadius(10)
              .shadow(radius: 3)
          )
        }
        
        OtherAppsButton()
      }
      .padding(.horizontal, 40)
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(
      LinearGradient(
        gradient: Gradient(colors: [.indiaOrange.opacity(0.2), .indiaOrange]),
        startPoint: .top,
        endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
    )
    .alert(isPresented: $showRatingAlert) {
      Alert(title: Text("Couldn't Open Rating Link"),
            message: Text("Please search for our app on the App Store to review. Thanks!"),
            dismissButton: .default(Text("OK")))
    }
  }
}

struct OtherAppsButton: View {
  @Environment(\.openURL) var openURL
  
  var body: some View {
    VStack {
      Button(action: {
        let developerURLString = "itms-apps://itunes.apple.com/developer/id1516706419"
        let possibleURL = URL(string: developerURLString)
        if let devURL = possibleURL {
          openURL(devURL)
        }
      }) {
        Text("Other Apps")
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .padding()
          .background(
            LinearGradient(gradient: Gradient(colors: [.indiaGreen, .green]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
          )
          .cornerRadius(10)
          .shadow(radius: 3)
      }
    }
  }
}

struct SettingsEl: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color.gray.opacity(0.2))
      .cornerRadius(10)
  }
}

struct Settings_Previews: PreviewProvider {
  static var previews: some View {
//    EmptyView()
//      .sheet(isPresented: .constant(true)) {
        Settings(testing: true)
//      }
  }
}
