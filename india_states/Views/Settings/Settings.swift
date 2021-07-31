//
//  Settings.swift
//  india_states
//
//  Created by Nate Brown on 7/26/21.
//

import SwiftUI

struct Settings: View {
  @Environment(\.presentationMode) var presentationMode
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {
    VStack {
      HStack {
        SettingsTitle()
        Spacer()
        Button(action: { presentationMode.wrappedValue.dismiss() }) { StandardXButton() }
      }
      SoundToggle()
      Spacer()
      VStack(spacing: 10) {
        RateButton()
        OtherAppsButton()
      }
      .padding(.horizontal, 40)
      .padding(.bottom)
      .if(horizontalSizeClass == .regular) { view in
        view.frame(maxWidth: 400)
      }
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(
      LinearGradient(
        gradient: Gradient(colors: [.indiaOrange.opacity(0.2), .indiaOrange]),
        startPoint: .top,
        endPoint: .bottom)
        .edgesIgnoringSafeArea(.all))
  }
}

struct SettingsTitle: View {
  @ScaledMetric var flagUp: CGFloat = 8
  
  var body: some View {
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
  }
}

struct SoundToggle: View {
  @AppStorage(SettingsKey.SOUND_ON) var soundOn: Bool = true
  
  var body: some View {
    let imageName = soundOn ? "speaker.fill" : "speaker.slash.fill"
    
    Toggle(isOn: $soundOn) { Text("Sound On \(Image(systemName: imageName))") }
      .toggleStyle(SwitchToggleStyle(tint: .indiaBlue))
      .modifier(SetElBackground())
      .padding(.top)
  }
}

struct RateButton: View {
  @Environment(\.openURL) var openURL
  
  var body: some View {
    Button(action: onRatePress) {
      VStack(spacing: 2) {
        Text("Rate")
        HStack {
          ForEach(0 ..< 5) { _ in
            Image(systemName: "star.fill") }
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
  }
  
  func onRatePress() {
    let ratingString = "itms-apps://itunes.apple.com/app/1578581115?action=write-review"
    guard let ratingURL = URL(string: ratingString) else { return }
    openURL(ratingURL)
  }
}

struct OtherAppsButton: View {
  @Environment(\.openURL) var openURL
  
  var body: some View {
    VStack {
      Button(action: openDeveloperPage) {
        Text("Other Apps")
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .padding()
          .background(
            LinearGradient(gradient: Gradient(colors: [.indiaGreen, .green]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing))
          .cornerRadius(10)
          .shadow(radius: 3)
      }
    }
  }
  
  func openDeveloperPage() {
    let developerURLString = "itms-apps://itunes.apple.com/developer/id1516706419"
    let possibleURL = URL(string: developerURLString)
    if let devURL = possibleURL { openURL(devURL) }
  }
}

struct SetElBackground: ViewModifier {
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
    Group {
      Settings()
      
      SettingsTitle()
        .defaultPreviewStyle(name: "Settings Title")
      
      SoundToggle()
        .defaultPreviewStyle(name: "Sound Toggle")
      
      RateButton()
        .defaultPreviewStyle(name: "Rating Button")
      
      OtherAppsButton()
        .defaultPreviewStyle(name: "Other Apps Button")
      
      Settings()
        .cornerRadius(20)
        .padding(100)
        .previewDevice("iPad Pro (11-inch) (3rd generation)")
        .previewDisplayName("iPad Settings")
      
      Settings()
        .previewLayout(.fixed(width: 500, height: 500))
        .previewDevice("Mac Catalyst")
        .previewDisplayName("Settings as seen in the Mac App")
    }
  }
}
