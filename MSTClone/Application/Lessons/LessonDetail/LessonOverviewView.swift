//
//  LessonOverviewView.swift
//  MSTClone
//
//  Created by Alin Khatri on 21/07/2023.
//

import SwiftUI

struct LessonOverviewView: View {
    
    let lesson: Lessons
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                LessonDescription(lesson: lesson)
                    .padding(20)
                Section(content: {
                    LessonsListView()
                }, header: {
                    Text("Related Videos")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                        .padding(.horizontal)
                })
                .headerProminence(.increased)
            }
        }
    }
}

//struct LessonOverviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        LessonOverviewView()
//    }
//}
