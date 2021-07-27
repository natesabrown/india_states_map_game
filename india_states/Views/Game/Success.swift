//
//  SwiftUIView.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI
import CoreLocation

let GOOD_RESPONSES = ["Correct!", "Great Job!", "Spot On!", "Correctamundo!", "Awesome!"]

struct Success: View {
  @State var goodResponse = GOOD_RESPONSES.randomElement()!
  @Binding var state: InState
  var onButtonPress: (() -> Void)?
  var test: Bool = false
  @Environment(\.openURL) var openURL
  
  var body: some View {
    GeometryReader { geo in
      ScrollView {
        ScrollViewReader { reader in
          Spacer().frame(height: geo.size.height * 0.05).id(0)
          VStack {
            VStack {
              Image(systemName: "checkmark.seal.fill")
                .resizable()
                .frame(width: 50, height: 50)
              Text(goodResponse)
                .font(.title)
                .bold()
            }
            .padding(.vertical)
            .foregroundColor(.green)
            Text(state.name)
              .font(.largeTitle)
              .bold()
              .padding(.top, -12)
              .padding(.bottom, -2)
            VStack {
              Image(state.image.source)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 250)
              HStack {
                if state.image.attr != nil {
                  Button(action: {
                    openURL(URL(string: state.image.license_type!.rawValue)!)
                  }) {
                    Text("Attribution: \(Text(state.image.attr!).bold()), Wikimedia Commons:  \(Text("License").bold())")
                      .font(.caption)
                      .lineLimit(1)
                      .minimumScaleFactor(0.5)
                  }
                  
                } else {
                  Text("Public Domain Image")
                    .font(.caption)
                }
              }
              .foregroundColor(Color(.systemGray3))
            }
            .padding(.horizontal)
            
            CapitalView(state: state)
              .padding(.top)
            
            VStack {
              Text("\(Image(systemName: "message.fill")) Languages")
                .font(.title3)
                .padding(.bottom, 5)
                .fixedSize(horizontal: false, vertical: true)
              Text("Official")
                .bold()
              LanguageView(langs: state.officialLangs)
              if state.secondLangs != nil {
                Text("Second")
                  .bold()
                LanguageView(langs: state.secondLangs!)
              }
            }
            .padding(.horizontal, 70)
            .padding(.vertical)
            .onAppear {
              reader.scrollTo(0)
            }
          }
          .multilineTextAlignment(.center)
          .foregroundColor(.white)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .padding(.top, test ? 0 : UIApplication.shared.windows.first!.safeAreaInsets.top)
          
          Spacer().frame(height: geo.size.height * 0.15)
        }
      }
    }
    .overlay(
      VStack {
        Spacer()
        Button(action: {
          if onButtonPress != nil {
            onButtonPress!()
          }
        }) {
          Text("Next")
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(
              RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .shadow(radius: 5)
            )
        }
      }
      .padding(.bottom, test ? 0 : UIApplication.shared.windows.first!.safeAreaInsets.bottom)
      .padding(.bottom)
    )
  }
}

struct LanguageView: View {
  var langs: [IndiaLanguage]
  @Environment(\.openURL) var openURL
  
  var body: some View {
    VStack {
      ForEach(Array(langs.enumerated()), id: \.offset) { index, lang in
        Button(action: {
          let langURL = URL(string: lang.getLink())
          if langURL != nil {
            openURL(langURL!)
          }
        }) {
          Text(lang.rawValue)
        }
        if index != langs.count - 1 {
          Divider()
        }
      }
    }
    .padding(.vertical)
    .frame(maxWidth: .infinity)
    .background(Color.gray.opacity(0.4).cornerRadius(15))
  }
  
  //  func openWikiPage(for name: String) {
  //    let _ = Wikipedia.shared.requestOptimizedSearchResults(
  //      language: WikipediaLanguage("en"),
  //      term: "\(name) language") { (searchResults, error) in
  //
  //      let firstURL = searchResults?.items[0].url
  //      if firstURL != nil {
  //        openURL(firstURL!)
  //      }
  //    }
  //  }
}

struct CapitalView: View {
  var state: InState
  @ScaledMetric var capitolOff: CGFloat = 3
  
  var body: some View {
    let capTup = state.capitals
    let exec = capTup.0
    let leg = capTup.1
    let jud = capTup.2
    
    VStack {
      HStack(alignment: .bottom) {
        Image("capitol2")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 25)
          .padding(.bottom, capitolOff)
        Text("Capitals")
          .font(.title3)
      }
      HStack {
        Spacer().overlay(CapEl(imageName: "suit_man", name: exec))
        if leg != nil {
          CapEl(imageName: "constitution", name: leg!)
        } else {
          CapEl(imageName: "constitution", name: "dummy")
            .opacity(0)
        }
        Spacer().overlay(CapEl(imageName: "hammer", name: jud))
      }
    }
  }
}

struct CapEl: View {
  var imageName: String
  var name: String
  
  @ScaledMetric var sunOff: CGFloat = -4
  
  var body: some View {
    let splitName = name.split(separator: "/")
    let has2 = splitName.count == 2
    
    VStack {
      Image(imageName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 20, height: 20)
      Group {
        if !has2 {
          Button(action: {
            self.openInMaps(for: name)
          }) {
            Text(name)
              .underline()
          }
        } else {
          let summerCap = String(splitName[0])
          let winterCap = String(splitName[1])
          VStack(spacing: 3) {
            Button(action: {
              self.openInMaps(for: summerCap)
            }) {
              HStack {
                Image(systemName: "sun.max.fill")
                Text(summerCap)
                  .underline()
                  .offset(x: sunOff)
              }
            }
            Button(action: {
              self.openInMaps(for: winterCap)
            }) {
              HStack {
                Image(systemName: "snow")
                Text(winterCap)
                  .underline()
                  .offset(x: sunOff)
              }
            }
          }
        }
      }
      .font(.footnote)
    }
  }
  
  func openInMaps(for location: String) {
    let geoCoder = CLGeocoder()
    geoCoder.geocodeAddressString(location) { (placemarks, error) in
      guard let placemarks = placemarks?.first else { return }
      let location = placemarks.location?.coordinate ?? CLLocationCoordinate2D()
      guard let url = URL(string:"http://maps.apple.com/?ll=\(location.latitude),\(location.longitude)&z=12") else { return }
      UIApplication.shared.open(url)
    }
  }
}

struct Success_Previews: PreviewProvider {
  static var previews: some View {
    Success(state: .constant(ANDAMAN_AND_NICOBAR_ISLANDS), test: true)
      .darkBackground()
  }
}
