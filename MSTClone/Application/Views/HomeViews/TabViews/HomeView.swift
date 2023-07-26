//
//  HomeView.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI

struct HomeView: View {
    let lists: [ListObject] = [
        ListObject(cardIcon: "play.rectangle", cardTitle: "Learn/Revise", cardSubTitle: "Click here if you want to learn something new, or revise something that you've already learned.", cardColor: Color("MSTBlue")),
        
        ListObject(cardIcon: "questionmark.bubble", cardTitle: "Get Answers", cardSubTitle: "Click here if you need us to help you solve a question or explain a particular concept to you.", cardColor: Color("MSTPurple")),
        
        ListObject(cardIcon: "square.and.pencil", cardTitle: "Assignments and Contents", cardSubTitle: "Click here to get, submit, and/or review assignments or other contents that your teacher may have assigned to you.", cardColor: Color("MSTYellow")),
        
        ListObject(cardIcon: "ellipsis.message", cardTitle: "Socialise", cardSubTitle: "Click here to socialise with members of your community, including entering live video and text-chat sessions", cardColor: Color("MSTOrange")),
        
        ListObject(cardIcon: "checkmark.square", cardTitle: "Test Yourself", cardSubTitle: "Click here to assess how good you are, and identify areas of weakness so that you can directly work on those areas", cardColor: Color("MSTGreen"))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Group {
                        Text("Welcome ")
                            .font(.subheadline)
                        +
                        Text("ALIN KHATRI")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        +
                        Text(", what would you like to do today?")
                            .font(.subheadline)
                    }
                }
                .padding(.top)
                
                ScrollView {
                    
                    ForEach(lists, id: \.self) { list in
                        ListCard(cardIcon: list.cardIcon, cardTitle: list.cardTitle, cardSubTitle: list.cardSubTitle, cardColor: list.cardColor)
                            .padding(.vertical, 4)
                    }
                }
                .padding()
            }
            .toolbar {
                TopNavBar()
            }
        }
    }
}

struct ListObject: Hashable {
    let cardIcon: String
    let cardTitle: String
    let cardSubTitle: String?
    let cardColor: Color
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
