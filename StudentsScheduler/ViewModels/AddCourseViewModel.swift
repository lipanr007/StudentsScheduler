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
    @Published var assetsList = [CourseAssets]()
    
    func addCourse() {
        let course = Course(name: name, day: day, startTime: startTime, duration: duration, type: type, room: room, building: building, assetsList: assetsList)
        // Save the course to your data store or perform any other actions here.
    }
}
