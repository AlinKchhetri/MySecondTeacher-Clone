//
//  MainHomeView.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI

struct MainHomeView: View {
    var body: some View {
        NavigationView {
            BottomNavBar()
        }
        .navigationBarBackButtonHidden()
    }
}

struct MainHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainHomeView()
    }
}
