//
//  UsersModel.swift
//  StudentsScheduler
//
//  Created by rares on 21.01.2023.
//

import Foundation

class User: Identifiable, Codable {
    var id = UUID()
    var username: String
    var password: String
    var courses: [Course]
    
    init(username: String, password: String, courses: [Course]) {
        self.username = username
        self.password = password
        self.courses = courses
    }
}

struct Users: Codable {
    var users: [User]
    
    init(users: [User]) {
        self.users = users
    }
}
