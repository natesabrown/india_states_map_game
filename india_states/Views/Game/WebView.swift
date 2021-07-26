//
//  WebView.swift
//  india_states
//
//  Created by Nate Brown on 7/14/21.
//

import SwiftUI
import WebKit
import UIKit

func getIndiaString() -> String {
  var returnString = ""
  if let filepath = Bundle.main.path(forResource: "india", ofType: "html") {
    do {
      let contents = try String(contentsOfFile: filepath)
      returnString = contents
      //        let replacedText = contents.replacingOccurrences(of: "west_bengal_1_", with: "\"west_bengal_1_\" fill=\"#000000!important\"")
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
      .onChange(of: state) { newState in
        loadImage()
      }
      .onAppear {
        loadImage()
      }
  }
  
  func loadImage() {
    let newText = getIndiaString()
    let replacedText = newText.replacingOccurrences(of: state.img_id, with: "\"\(state.img_id)\" fill=\"#000000!important\"")
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
