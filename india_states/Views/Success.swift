//
//  SwiftUIView.swift
//  india_states
//
//  Created by Nate Brown on 7/15/21.
//

import SwiftUI
//import WikipediaKit

let GOOD_RESPONSES = ["Correct!", "Great Job!", "Spot On!"]

/// https://stackoverflow.com/questions/42913672/remove-substring-between-parentheses
extension String {
  private func regExprOfDetectingStringsBetween(str1: String, str2: String) -> String {
    return "(?:\(str1))(.*?)(?:\(str2))"
  }
  
  func replacingOccurrences(from subString1: String, to subString2: String, with replacement: String) -> String {
    let regExpr = regExprOfDetectingStringsBetween(str1: subString1, str2: subString2)
    return replacingOccurrences(of: regExpr, with: replacement, options: .regularExpression)
  }
}

//class SuccessObject: ObservableObject {
//  @Published var name: String? = nil {
//    didSet {
//      if name != nil {
//        setDescription(of: name!)
//      }
//    }
//  }
//  @Published var description: String? = nil
//
//  func setDescription(of stateName: String) {
//    let language = WikipediaLanguage("en")
//
//    let _ = Wikipedia.shared.requestOptimizedSearchResults(language: language, term: stateName) { (searchResults, error) in
//      guard error == nil else { return }
//      guard let searchResults = searchResults else { return }
//      self.description = "\(searchResults.items[0].displayText.replacingOccurrences(from: "(", to: ")", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").components(separatedBy: ". ")[0..<5].joined(separator: ". ").replacingOccurrences(of: "  ", with: " "))."
//    }
//  }
//}

struct Success: View {
  @State var goodResponse = GOOD_RESPONSES.randomElement()!
  @Binding var state: InState
  //  @ObservedObject var successObject = SuccessObject()
  var onButtonPress: (() -> Void)?
  @Environment(\.openURL) var openURL
  
  var body: some View {
    GeometryReader { geo in
      ScrollView {
        Spacer().frame(height: geo.size.height * 0.05)
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
          
          VStack {
            Text("\(Image(systemName: "message.fill")) Languages")
              .font(.title3)
              .padding(.bottom, 5)
            Text("Official")
              .bold()
            VStack(alignment: .leading) {
              ForEach(Array(state.officialLangs.enumerated()), id: \.offset) { index, lang in
                HStack {
                  Text(lang.rawValue)
                }
              }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray.opacity(0.4).cornerRadius(15))
            if state.secondLangs != nil {
              Text("Second")
                .bold()
              VStack(alignment: .leading) {
                ForEach(Array(state.secondLangs!.enumerated()), id: \.offset) { index, lang in
                  Text(lang.rawValue)
                }
              }
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color.gray.opacity(0.4).cornerRadius(15))
            }
          }
          .padding(.horizontal, 70)
          .padding(.vertical)
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //    .onAppear {
        //      successObject.name = state.name
        //    }
        .padding(.top, UIApplication.shared.windows.first!.safeAreaInsets.top )
        
        Spacer().frame(height: geo.size.height * 0.15)
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
            )
        }
      }
      .padding(.bottom, UIApplication.shared.windows.first!.safeAreaInsets.bottom )
      .padding(.bottom)
    )
  }
}

struct Success_Previews: PreviewProvider {
  static var previews: some View {
    Success(state: .constant(PUDUCHERRY))
      .background(Color.black.opacity(0.8).edgesIgnoringSafeArea(.all))
  }
}
