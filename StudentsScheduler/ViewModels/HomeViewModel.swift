//
//  HomeViewModel.swift
//  StudentsScheduler
//
//  Created by rares on 10.04.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var courses: [Course] = []
    private let userDataManager = UserDataManager.shared
    
    func loadData() {
        if let currentUser = userDataManager.getCurrentUser() {
            courses = currentUser.courses
        }
    }
}

