//
//  UsersModel.swift
//  StudentsScheduler
//
//  Created by rares on 21.01.2023.
//

import SwiftUI

class User: Identifiable, Codable {
    var id = UUID()
    var username: String
    var password: String
    var homeAddress: String
    var universityAddress: String
    var courses: [Course]
    
    init(username: String, password: String, homeAddress: String, universityAddress: String, courses: [Course]) {
        self.username = username
        self.password = password
        self.homeAddress = homeAddress
        self.universityAddress = universityAddress
        self.courses = courses
    }
}

struct Users: Codable {
    var users: [User]
    
    init(users: [User]) {
        self.users = users
    }
}
