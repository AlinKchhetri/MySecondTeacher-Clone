//
//  SegmentedNavBar.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI

struct SegmentedNavItem: View {
    
    @Binding var selectedTabIndex: Int
    var tabIndex: Int
    var tabName: String
    
    var body: some View {
                Button(action: {
                    self.selectedTabIndex = tabIndex
                }, label: {
                    VStack {
                        Text(tabName)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("MSTPurple"))
                        Capsule().fill(self.selectedTabIndex == tabIndex ? Color("MSTPurple") : Color.clear)
                            .frame(height: 4)
                    }
                    .padding()
            })
    }
}
