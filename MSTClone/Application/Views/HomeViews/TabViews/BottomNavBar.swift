//
//  BottomNavBar.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI

struct BottomNavBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem() {
                    Image(systemName: "square.grid.2x2")
                    Text("Home")
                }
            
            SubjectView()
                .tabItem() {
                    Image(systemName: "book")
                    Text("Subject")
                }
            
            ClassroomView()
                .tabItem() {
                    Image(systemName: "pencil.tip")
                    Text("Classroom")
                }
            
            ChatView()
                .tabItem() {
                    Image(systemName: "ellipsis.bubble")
                    Text("Chat")
                }
            
            MoreView()
                .tabItem() {
                    Image(systemName: "ellipsis.circle")
                    Text("More")
                }
        }
        .accentColor(Color("MSTPurple"))

    }
}

struct BottomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavBar()
    }
}
