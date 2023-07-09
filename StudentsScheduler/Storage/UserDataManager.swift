//
//  UserDataManager.swift
//  StudentsScheduler
//
//  Created by rares on 05.07.2023.
//

import SwiftUI

class UserDataManager {
    static var shared = UserDataManager()
    
    private var currentUser: User?

    private let userDefaults = UserDefaults.standard
    
    init() {
        self.currentUser = getCurrentUser()
    }
    
    func saveUser(_ user: User) {
        if let data = try? JSONEncoder().encode(user) {
            userDefaults.set(data, forKey: user.username)
        }
        
        if let data = try? JSONEncoder().encode(user) {
            userDefaults.set(data, forKey: "CurrentUser")
        }
    }
    
    func saveCourses(_ courses: [Course], forUser user: User) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(courses)
            
            userDefaults.set(data, forKey: "\(user.username)_courses")
        } catch {
            print("Unable to Encode Courses (\(error))")
        }
    }
    
    func getCurrentUser() -> User? {
        if let data = userDefaults.data(forKey: "CurrentUser"),
           let user = try? JSONDecoder().decode(User.self, from: data) {
            return user
        }
        return nil
    }
    
    func getCourses(_ user: User) -> [Course]? {
        if let data = userDefaults.data(forKey: user.username),
           let user = try? JSONDecoder().decode(User.self, from: data) {
            return user.courses
        }
        return nil
    }
    
    
}
