//
//  LessonsListViewModel.swift
//  MSTClone
//
//

import SwiftUI

final class LessonsListViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var lessons: [Lessons] = []
    @Published var alertItem: AlertItem?
    
    func getLessons() {
        NetworkManager.shared.getLessons { result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result {
                case .success(let lessons):
                    self.lessons = lessons
                case .failure(let error):
                    if !lessons.isEmpty { return } // only show error popup if the saved data is empty
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidUrl:
                        alertItem = AlertContext.invalidUrl
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
