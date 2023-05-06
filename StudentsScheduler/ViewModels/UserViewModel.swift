//
//  UserViewModel.swift
//  StudentsScheduler
//
//  Created by rares on 10.04.2023.
//

import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user: User?
    
    func signOut() {
        // code to sign out user
    }
    
    func updateProfile() {
        // code to update user profile
    }
    
    func changePassword() {
        // code to change user password
    }
}

