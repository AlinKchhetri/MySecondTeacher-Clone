//
//  SocialSignIn.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI

struct SocialSignIn: View {
    
    var orText: String

    var body: some View {
        VStack {
            HStack {
                VStack{
                    Divider()
                }
                .padding(.leading, 20)
                Text(orText)
                    .font(.caption)
                    .lineLimit(1)
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .padding(.horizontal, 5)
                VStack{
                    Divider()
                }
                .padding(.trailing, 20)
            }
            .padding(.vertical)
            
            HStack(alignment: .center, spacing: 15) {
                Image("Google")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(12)
                    .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 1))
                
                Image("Facebook")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(12)
                    .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 1))
                Image(systemName: "apple.logo")
                    .font(.system(size: 25))
                    .padding(12)
                    .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 1))
            }
        }
    }
}
