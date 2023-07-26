//
//  ClassroomView.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI

struct ClassroomView: View {
    
    @State var selectedIndex = 0
    
    enum Subject: String, CaseIterable, Identifiable {
        case assessment
        var id: Self { self }
    }

    @State private var selectedSubject: Subject = .assessment
    
    
    enum Class: String, CaseIterable, Identifiable {
        case CC6001, CS6004, CS6P05, FC6W51
        var id: Self { self }
    }

    @State private var selectedClass: Class = .CC6001

    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 10) {
                    Picker("Subject", selection: $selectedSubject) {
                        Text("Assessment").tag(Subject.assessment)
                    }
                    .tint(.gray)
                    .frame(maxWidth: UIScreen.main.bounds.width/1.5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke( Color.gray.opacity(0.4), lineWidth: 1))
                    
                    
                    
                    Picker("Class", selection: $selectedClass) {
                        Text("CS6P05NI").tag(Class.CS6P05)
                        Text("FC6W51NI").tag(Class.FC6W51)
                        Text("CC6001NI").tag(Class.CC6001)
                        Text("CC6001NI").tag(Class.CC6001)
                        Text("CC6004NI").tag(Class.CS6004)
                    }
                    .lineLimit(2)
                    .tint(.gray)
                    .frame(maxWidth: UIScreen.main.bounds.width/1.5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke( Color.gray.opacity(0.4), lineWidth: 1))

                }
                .padding(.horizontal)
                .padding(.top)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        SegmentedNavItem(selectedTabIndex: $selectedIndex, tabIndex: 0, tabName: "Teacher's Session")
                        
                        SegmentedNavItem(selectedTabIndex: $selectedIndex, tabIndex: 1, tabName: "Assignments")
                        
                        SegmentedNavItem(selectedTabIndex: $selectedIndex, tabIndex: 2, tabName: "Teacher's Content")
                    }
                }
                
                ScrollView {
                    
                }
            }
            .toolbar {
                TopNavBar()
            }
        }
    }
}

struct ClassroomView_Previews: PreviewProvider {
    static var previews: some View {
        ClassroomView()
    }
}
