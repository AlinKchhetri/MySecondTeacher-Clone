//
//  ChatView.swift
//  MSTClone
//
//  Created by Alin Khatri on 02/06/2023.
//

import SwiftUI


struct ChatView: View {
    
    @State var messageText = ""
    @State var messages: [String] = ["Welcome to My Second Teacher Chat Bot!"]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    ForEach(messages, id: \.self) { message in
                        // If the message contains [USER], that means it's us
                        if message.contains("[USER]") {
                            let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                            
                            // User message styles
                            HStack {
                                Spacer()
                                Text(newMessage)
                                    .padding(13)
                                    .foregroundColor(Color.white)
                                    .background(Color("MSTPurple").opacity(0.8))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10)
                            }
                        } else {
                            
                            // Bot message styles
                            HStack {
                                Text(message)
                                    .padding(13)
                                    .background(Color.gray.opacity(0.15))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10)
                                Spacer()
                            }
                        }
                        
                    }.rotationEffect(.degrees(180))
                }
                .rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.1))
                
                
                // Contains the Message bar
                HStack {
                    TextField("Type something", text: $messageText)
                        .padding(15)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .onSubmit {
                            sendMessage(message: messageText)
                        }
                    
                    Button {
                        sendMessage(message: messageText)
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(Color("MSTPurple"))
                    }
                    .font(.system(size: 25))
                    .padding(.horizontal, 10)
                }
                
                .padding()
            }
            .navigationTitle("My Second Teacher Chat Bot")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(
                Color("MSTPurple"),
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
    
    
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    messages.append(getBotResponse(message: message))
                }
            }
        }
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

