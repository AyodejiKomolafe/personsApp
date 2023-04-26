//
//  User.swift
//  Persons
//
//  Created by Kvng Eko on 4/26/23.
//

import Foundation


struct User: Codable, Identifiable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}

struct UserResponse: Codable {
    let data: [User]
}

struct MockUser {
    static let sampleUser = User(id: 001, email: "kaap@gmail.com", first_name: "Test", last_name: "User", avatar: "")
    static let users = [sampleUser, sampleUser, sampleUser]
}
