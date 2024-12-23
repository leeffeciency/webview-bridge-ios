import SwiftUI

struct WebviewURLInputScreen: View {
    @State private var urlString: String = ""
    @State private var shouldNavigateToWebView = false
    @State private var errorMessage: String? = nil
    
    private func processURL(_ url: String) -> String {
        let trimmedUrl = url.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedUrl.hasPrefix("http://") || trimmedUrl.hasPrefix("https://") {
            return trimmedUrl
        }
        
        if trimmedUrl.hasPrefix("localhost") || trimmedUrl.hasPrefix("127.0.0.1") {
            return "http://" + trimmedUrl
        }
        
        return "https://" + trimmedUrl
    }
    
    private func validateURL(_ url: String) -> Bool {
        let processedUrl = processURL(url)
        guard URL(string: processedUrl) != nil else {
            errorMessage = "Invalid URL format"
            return false
        }
        return true
    }
    
    var body: some View {
        NavigationStack {  // NavigationView를 NavigationStack으로 변경
            VStack(alignment: .leading, spacing: 20) {
                Text("Enter webview URL")
                    .font(.headline)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 8) {
                    URLTextField(text: $urlString, placeholder: "https://example.com")
                        .frame(height: 40)
                        .padding(.horizontal)
                    
                    if let error = errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.horizontal)
                    }
                }
                
                Button(action: {
                    let trimmedUrl = urlString.trimmingCharacters(in: .whitespacesAndNewlines)
                    if validateURL(trimmedUrl) {
                        urlString = processURL(trimmedUrl)
                        errorMessage = nil
                        shouldNavigateToWebView = true
                    }
                }) {
                    Text("Open")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(urlString.isEmpty ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(urlString.isEmpty)
                .padding(.horizontal)
                
                // NavigationLink를 새로운 방식으로 변경
                .navigationDestination(isPresented: $shouldNavigateToWebView) {
                    WebViewScreen(urlString: urlString)
                }
                
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    WebviewURLInputScreen()
}
