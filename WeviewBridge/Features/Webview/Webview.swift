// Import required frameworks (same concept as TypeScript imports)
import SwiftUI    // iOS modern UI framework (similar to React - declarative UI framework)
import WebKit     // For WebView functionality (similar to React Native's WebView)
import UIKit      // iOS basic UI framework (older but still necessary for some features)

// Define WebView component (similar to React functional component)
struct WebView: UIViewRepresentable {
   // URL string to be received from outside like props
   let urlString: String
   
   // Called when component is first created
   // (similar timing to React's useEffect(() => {}, []))
   func makeUIView(context: Context) -> WKWebView {
       // Create and return WKWebView (similar to creating WebView in React Native)
       return WKWebView()
   }
   
   // Called when props are updated
   // (similar to React's useEffect(() => {}, [dependency]))
   func updateUIView(_ webView: WKWebView, context: Context) {
       // Check if URL string can be converted to valid URL
       // (similar to TypeScript's optional chaining)
       if let url = URL(string: urlString) {
           // Create URLRequest (similar to fetch's Request object)
           let request = URLRequest(url: url)
           // Load URL in WebView (similar to location.href or window.open())
           webView.load(request)
       }
   }
}
