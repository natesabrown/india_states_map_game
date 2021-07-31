//
//  WebView.swift
//  india_states
//
//  Created by Nate Brown on 7/14/21.
//

import SwiftUI
import WebKit
import UIKit

fileprivate func getIndiaString() -> String {
  var returnString = ""
  if let filepath = Bundle.main.path(forResource: "india", ofType: "html") {
    do {
      let contents = try String(contentsOfFile: filepath)
      returnString = contents
    } catch {
      print("Error getting SVG string: \(error)")
    }
  }
  return returnString
}

struct WebViewController: View {
  @Binding var state: InState
  @State var text = getIndiaString()
  
  var body: some View {
    WebView(text: $text)
      .onAppear { loadImage() }
      .onChange(of: state) { _ in loadImage() }
  }
  
  /// sets the HTML to color the current state
  func loadImage() {
    let newText = getIndiaString()
    let strokeColor = "#FF0000"
    var replacedText = ""
    if state.bordered {
      replacedText = newText.replacingOccurrences(of: state.img_id, with: "\"\(state.img_id)\" style=\"stroke:\(strokeColor); stroke-width: 6.0;")
    } else {
      replacedText = newText.replacingOccurrences(of: state.img_id, with: "\"\(state.img_id)\" style=\"fill:\(strokeColor)")
    }
    text = replacedText
  }
}

struct WebView: UIViewRepresentable {
  @Binding var text: String
  
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.loadHTMLString(text, baseURL: nil)
  }
}

struct WebView_Previews: PreviewProvider {
  static var previews: some View {
    WebViewController(state: .constant(MADHYA_PRADESH))
  }
}
