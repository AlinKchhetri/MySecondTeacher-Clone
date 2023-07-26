//
//  SubjectView.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI

struct SubjectView: View {
    @State var currentTab: Int = 0
    var body: some View {
        NavigationStack {
            
            VStack() {
                TabBarView(currentTab: self.$currentTab, tabBarOptions: ["My Library", "MST Store"])

                TabView(selection: self.$currentTab) {
                    LessonsListView().tag(0)
                    MSTStoreView().tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .toolbar {
                TopNavBar()
            }
        }
    }
}

struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBarOptions: [String]
    
    var body: some View {
            HStack(alignment: .center) {
                ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                        id: \.0,
                        content: {
                    index, name in
                    TabBarItem(currentTab: self.$currentTab,
                               namespace: namespace.self,
                               tabBarItemName: name,
                               tab: index)
                    
                })
            }
            .padding(.horizontal)
        .frame(height: 30)
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tab: Int
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Spacer()
                Text(tabBarItemName)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("MSTPurple"))
                if currentTab == tab {
                    Color("MSTPurple")
                        .frame(height: 3)
                        .matchedGeometryEffect(id: "underline",
                                               in: namespace,
                                               properties: .frame)
                } else {
                    Color.clear.frame(height: 2)
                }
            }
            .animation(.spring(), value: self.currentTab)
        }
        .buttonStyle(.plain)
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView()
    }
}
