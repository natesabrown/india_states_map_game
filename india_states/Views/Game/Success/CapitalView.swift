//
//  CapitalView.swift
//  india_states
//
//  Created by Nate Brown on 7/30/21.
//

import SwiftUI
import CoreLocation

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
        /// Takes into account whether there is/isn't a legislative capital
        CapEl(imageName: "constitution", name: leg ?? "")
          .opacity(leg == nil ? 0 : 1)
        Spacer().overlay(CapEl(imageName: "hammer", name: jud))
      }
    }
    .foregroundColor(.white)
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

struct CapitalView_Previews: PreviewProvider {
  static var previews: some View {
    CapitalView(state: STATES_UT.randomElement()!)
      .preferredColorScheme(.dark)
      .defaultPreviewStyle(name: "Capitals")
  }
}
