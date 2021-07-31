//
//  LanguageView.swift
//  india_states
//
//  Created by Nate Brown on 7/30/21.
//

import SwiftUI

struct LanguageView: View {
  var langs: [IndiaLanguage]
  @Environment(\.openURL) var openURL
  
  var body: some View {
    VStack {
      ForEach(Array(langs.enumerated()), id: \.offset) { index, lang in
        Button(action: { openLangLink(lang: lang) }) {
          Text(lang.rawValue)
            .foregroundColor(.white)
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
  
  func openLangLink(lang: IndiaLanguage) {
    guard let langURL = URL(string: lang.getLink()) else { return }
    openURL(langURL)
  }
}

fileprivate func getRandomLangList() -> [IndiaLanguage] {
  var list: [IndiaLanguage] = []
  let num = Int.random(in: 1...8)
  let someLangs: [IndiaLanguage] = [
    .ANGIKA, .ASSAMESE, .BENGALI, .BHOJPURI, .BODO,
    .CHHATTISGARHI, .DOGRI, .ENGLISH ]
  (0 ..< num).forEach { _ in
    list.append(someLangs.randomElement()!)
  }
  return list
}

struct LanguageView_Previews: PreviewProvider {
  static var previews: some View {
    LanguageView(langs: getRandomLangList())
      .preferredColorScheme(.dark)
  }
}
