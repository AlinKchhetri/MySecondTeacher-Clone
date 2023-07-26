//
//  MoreView.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationView {
            VStack {
                //More Header
                
                HStack (spacing: 20) {
                    Image(systemName: "person")
                        .font(.system(size: 25))
                        .foregroundColor(Color("MSTGreen"))
                        .padding(10)
                        .background(Color("MSTGreen").opacity(0.3))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("ALIN KHATRI")
                            .font(.headline)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        Text("np123456@islingtoncollege.edu.np")
                            .font(.callout)
                    }
                    
                    Image(systemName: "pencil.circle")
                        .font(.system(size: 25))
                        .foregroundColor(Color("MSTBlue"))
                }
                
                HStack {
                    Image("MSTLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, alignment: .leading)
                            .padding(.vertical, 20)
                    VStack(alignment: .leading) {
                        Text("Islington College Kathmandu")
                            .font(.callout)
                            .fontWeight(.semibold)
                        Text("Kathmandu, Nepal")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .background(Color(.gray).opacity(0.1))
                .cornerRadius(10)
                .padding(10)
                
                
                ScrollView {
                    NavigationLink(destination: AccountView(), label: {
                        MoreItem(listIcon: "person.crop.circle", listTitle: "Account")
                    })
                    .buttonStyle(.plain)
                    MoreItem(listIcon: "megaphone", listTitle: "Notices")
                    MoreItem(listIcon: "arrow.down.to.line", listTitle: "Downloads")
                    MoreItem(listIcon: "link", listTitle: "Linked Guardian Accounts")
                    MoreItem(listIcon: "paperplane", listTitle: "Linked Social Accounts")
                    MoreItem(listIcon: "lock.display", listTitle: "Manage Subscriptions")
                    MoreItem(listIcon: "indianrupeesign.circle", listTitle: "Payment Transaction Status")
                    MoreItem(listIcon: "giftcard", listTitle: "Redeem Coupon")

                }
            }
        }
    }
}

struct MoreItem: View {
     var listIcon: String
     var listTitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 20) {
                Image(systemName: listIcon)
                Text(listTitle)
            }
            .padding(15)
            Divider()
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
