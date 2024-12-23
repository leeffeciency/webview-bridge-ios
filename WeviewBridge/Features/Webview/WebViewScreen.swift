// WebViewScreen.swift

import SwiftUI

struct WebViewScreen: View {
    let urlString: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        WebView(urlString: urlString)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)  // 뒤로가기 버튼 명시적 표시
            .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    NavigationStack {  // Preview에서만 NavigationStack 사용
        WebViewScreen(urlString: "https://www.example.com")
    }
}
