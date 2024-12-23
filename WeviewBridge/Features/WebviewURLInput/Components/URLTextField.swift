// URLTextField.swift

import SwiftUI
import UIKit

struct URLTextField: UIViewRepresentable {
   @Binding var text: String
   let placeholder: String
   
   func makeUIView(context: Context) -> UITextField {
       let textField = UITextField()
       textField.placeholder = placeholder
       textField.borderStyle = .roundedRect
       textField.autocapitalizationType = .none
       textField.autocorrectionType = .no
       textField.spellCheckingType = .no
       textField.keyboardType = .URL
       textField.delegate = context.coordinator
       textField.textContentType = .URL
       return textField
   }
   
   func updateUIView(_ uiView: UITextField, context: Context) {
       uiView.text = text
   }
   
   func makeCoordinator() -> Coordinator {
       Coordinator(text: $text)
   }
   
   class Coordinator: NSObject, UITextFieldDelegate {
       @Binding var text: String
       
       init(text: Binding<String>) {
           self._text = text
       }
       
       func textFieldDidChangeSelection(_ textField: UITextField) {
           text = textField.text ?? ""
       }
   }
}

#Preview {
   struct PreviewWrapper: View {
       @State private var text = ""
       
       var body: some View {
           URLTextField(text: $text, placeholder: "https://example.com")
               .padding()
       }
   }
   
   return PreviewWrapper()
}
