//
//  CustomTextField.swift
//  MSTClone
//
//  Created by Alin Khatri on 01/06/2023.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    var placeholder: String

    var body: some View {
            TextField(placeholder, text: $text)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(isFocused ? Color("MSTPurple") : Color.gray.opacity(0.4) , lineWidth: 1)
                        )
                .padding(.vertical, 7)
                .focused($isFocused)
    }
}
