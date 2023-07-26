//
//  MainView.swift
//  MSTClone
//
//  Created by Alin Khatri on 01/06/2023.
//

import SwiftUI

struct MainView: View {
    
    // Check the login status
    let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    var body: some View {
        if (isLoggedIn ) {
            BottomNavBar()
        } else {
            SignInView()

        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
