//
//  LessonsList.swift
//  MSTClone
//
//

import SwiftUI
import Kingfisher

struct LessonsListView: View {
    
    @StateObject var viewModel = LessonsListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading { ProgressView() }
                List(viewModel.lessons, id: \.id) { lesson in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: LessonDetailMainView(lesson: lesson) ) { EmptyView() }.opacity(0.0)
                        LessonListCell(lesson: lesson)
                    }
                }
                .listStyle(.plain)
                .buttonStyle(PlainButtonStyle())
            }
        }
        .onAppear() {
            viewModel.getLessons()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton
            )
        }
    }
}

struct LessonDescription: View {
    let lesson: Lessons
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Photography")
                .font(.caption)
                .foregroundColor(.gray)
            Text(lesson.name)
                .font(.subheadline)
                .fontWeight(.medium)
            HStack(spacing: 20) {
                HStack(spacing: 2) {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.teal)
                        .font(.caption2)
                    Text("100%")
                        .font(.caption2)
                }
                HStack(spacing: 2) {
                    Image(systemName: "star.circle")
                        .foregroundColor(Color("MSTPurple"))
                        .font(.caption2)
                    Text("N/A")
                        .font(.caption2)
                }
            }
        }
    }
}

struct LessonListCell: View {
    
    let lesson: Lessons
    
    var body: some View {
        HStack(spacing: 10) {
            KFImage(URL(string: lesson.thumbnail))
                .placeholder {
                    Color.gray
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 80)
                .cornerRadius(4)
            
            LessonDescription(lesson: lesson)
        }
        .padding(10)
    }
}

struct LessonsListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonsListView()
    }
}
