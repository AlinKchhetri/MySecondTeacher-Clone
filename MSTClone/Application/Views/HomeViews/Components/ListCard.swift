//
//  ListCard.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI

struct ListCard: View {
    
    var cardIcon: String
    var cardTitle: String
    var cardSubTitle: String?
    var cardColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: cardIcon)
                    .font(.system(size: 25))
                    .foregroundColor(cardColor)
                Text(cardTitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(cardColor)
            }
            
            Text(cardSubTitle ?? "")
                .font(.caption)
                .foregroundColor(Color.gray)
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(cardColor.opacity(0.05))
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(cardColor.opacity(0.5), lineWidth: 1)
                )


    }
}

struct ListCard_Previews: PreviewProvider {
    static var previews: some View {
        ListCard(cardIcon: "list.clipboard", cardTitle: "Task List", cardSubTitle: "very very long text example", cardColor: .pink)
    }
}
