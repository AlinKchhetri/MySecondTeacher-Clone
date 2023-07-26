//
//  User.swift
//  MySecondTeacherClone
//
//  Created by Alin Khatri on 17/06/2023.
//

import Foundation

struct User: Decodable {
    let userId: Int
    let name: String
    let email: String
    let phoneNumber: Int
    let verified: Bool
    let role: String
}


struct RegisterUserRequest: Codable {
    let name: String
    let email: String
    let password: String
    let phoneNumber: Int
}

struct LoginUserRequest: Codable {
    let email: String
    let password: String
}

