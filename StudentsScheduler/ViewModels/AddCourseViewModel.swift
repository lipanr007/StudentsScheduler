//
//  AddCourseViewModel.swift
//  StudentsScheduler
//
//  Created by rares on 01.05.2023.
//

import SwiftUI

class AddCourseViewModel: ObservableObject {
    @Published var name = ""
    @Published var day = Course.WeekDay.monday
    @Published var startTime = Date()
    @Published var duration = 1
    @Published var type = Course.CourseType.course
    @Published var room = ""
    @Published var building = ""
    @Published var addedCourse: Course?
    
    func addCourse() {
        let course = Course(name: name, day: day, startTime: startTime, duration: duration, type: type, room: room, building: building, assetsList: [])
        
        if let user = UserDataManager.shared.getCurrentUser() {
                    user.courses.append(course)
                    UserDataManager.shared.saveUser(user)
                    addedCourse = course
                }
        
        // Retrieve the current user from UserDefaults
        if let data = UserDefaults.standard.data(forKey: "CurrentUser"),
           let currentUser = try? JSONDecoder().decode(User.self, from: data) {
            
            // Add the course to the user's courses
            currentUser.courses.append(course)
            self.addedCourse = course
            
            // Update the user in UserDefaults
            if let updatedData = try? JSONEncoder().encode(currentUser) {
                UserDefaults.standard.set(updatedData, forKey: "CurrentUser")
            }
        }
    }
    
    private func saveCourses(user: User) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user.courses)
            
            UserDefaults.standard.set(data, forKey: "\(user.username)_courses")
        } catch {
            print("Unable to Encode Courses (\(error))")
        }
    }
    
    private func getUser() -> User? {
        // Retrieve the user from the environment
        return UserDefaults.standard.getUser()
    }
}
