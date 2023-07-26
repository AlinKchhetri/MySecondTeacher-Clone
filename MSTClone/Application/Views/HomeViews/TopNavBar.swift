//
//  TopNavBar.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI

//struct TopNavBar: View {
//
//    var body: some View {
//
//        VStack(spacing: -10) {
//            HStack {
//                Image("MSTLogo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 40, alignment: .leading)
//                        .padding(.vertical, 20)
//                Spacer()
//                HStack(spacing: 20) {
//                    Button(action: {}, label: {
//                        Image(systemName: "magnifyingglass")
//                            .font(.system(size: 20))
//                    })
//                    .buttonStyle(.plain)
//
//                    Button(action: {
//
//                    }, label: {
//                        Image(systemName: "bell")
//                            .font(.system(size: 20))
//                    })
//                    .buttonStyle(.plain)
//                }
//            }
//            Divider()
//        }
//        .padding(.horizontal, 20)
//        .padding(.top, 35)
//    }
//}

struct TopNavBar : ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Image("MSTLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .leading)
            
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack(spacing: 20) {
                Button(action: {}, label: {
                    Image(systemName: "magnifyingglass")
                })
                .buttonStyle(.plain)
                
                ZStack {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "bell")
                        
                    })
                    .buttonStyle(.plain)
                    
                    Text("5").font(.caption2).padding(6).background(Color.red).clipShape(Circle()).foregroundColor(.white).offset(x: 10, y: -10)
                }
            }
        }
    }
}

//struct TopNavBar_Previews: PreviewProvider {
//    static var previews: some ToolbarContent {
//        TopNavBar()
//    }
//}
