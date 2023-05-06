//
//  HomeViewModel.swift
//  StudentsScheduler
//
//  Created by rares on 10.04.2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var courses: [Course] = []
    
    func loadData() {
        // Load user's courses and schedule from the backend API
        // and assign the results to the courses and schedule properties.
    }
}
