//
//  AccountView.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI

struct Article: Identifiable {
    var id: String { title }
    let title: String
    let description: String
}

struct AccountView: View {

    @State private var showAlert = false
    @State private var article = Article(title: "My Second Teacher", description: "Are you sure you want to logout?")
        
    var body: some View {
        NavigationView {
            VStack {
                MoreItem(listIcon: "creditcard", listTitle: "Purchase History")
                MoreItem(listIcon: "lock", listTitle: "Change Password")
                MoreItem(listIcon: "trash", listTitle: "Delete Account")
                MoreItem(listIcon: "creditcard", listTitle: "Purchase History")

                Button(action: {
                    showAlert = true
                }, label: {
                    MoreItem(listIcon: "arrow.right.to.line", listTitle: "Logout")
                })
                .buttonStyle(.plain)
                .alert(article.title, isPresented: $showAlert, presenting: article) {article in
                    Button("No", role: .cancel) {}
                    Button("Yes") {
                        UserDefaults.standard.set(false, forKey: "isLoggedIn")
                    }
                } message: {article in
                    Text(article.description)
                }
                
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
