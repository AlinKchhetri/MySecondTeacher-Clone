//
//  ServerResponse.swift
//  MySecondTeacherClone
//
//  Created by Alin Khatri on 17/06/2023.
//

import Foundation

class ServerResponse: Decodable {
    let success: Bool
    let message: String
    let userData: User?
}
