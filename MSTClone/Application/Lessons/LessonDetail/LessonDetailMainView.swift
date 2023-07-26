//
//  LessonDetailMainView.swift
//  MSTClone
//
//  Created by Alin Khatri on 21/07/2023.
//

import SwiftUI

struct LessonDetailMainView: View {
    
    let lesson: Lessons
    @State var currentTab: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                LessonDetailView(lesson: lesson)
                    .frame(height: 230)
                VStack() {
                    TabBarView(currentTab: self.$currentTab, tabBarOptions: ["Overview", "Report", "Resources"])

                    TabView(selection: self.$currentTab) {
                        LessonOverviewView(lesson: lesson).tag(0)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
                .padding(.top)
            }

        }
    }
}

