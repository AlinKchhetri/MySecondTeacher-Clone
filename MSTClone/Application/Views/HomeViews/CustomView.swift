//
//  CustomView.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI

struct CustomView: View {
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    Text("Welcome ")
                        .font(.subheadline)
                    +
                    Text("ALIN KHATRI")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    +
                    Text(", what would you like to do today?")
                        .font(.subheadline)
                }
                
                
                ScrollView {
                    ForEach(0 ..< 10) { item in
                        Text("hello")
                    }
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}
