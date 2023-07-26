//
//  ChatBotResponse.swift
//  MST
//
//  Created by Alin Khatri on 18/07/2023.
//

import Foundation


func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") || tempMessage.contains("hi") || tempMessage.contains("hey") {
        return "Hey there! \nHow can I help you?"
    } else if tempMessage.contains("goodbye") || tempMessage.contains("bye") {
        return "Talk to you later! \nBye"
    } else if tempMessage.contains("how are you") {
        return "I'm fine, how about you?"
    } else {
        return "I'm sorry, I didn't understand your message."
    }
}
