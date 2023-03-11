//
//  CourseModel.swift
//  StudentsScheduler
//
//  Created by rares on 22.01.2023.
//

import SwiftUI

class Course: Identifiable, Codable {
    var id = UUID()
    var name: String
    var day: WeekDay
    var startTime: Date
    var duration: Int
    var type: CourseType
    var room: String
    var building: String
    var assetsList: [CourseAssets]
    
    enum WeekDay: String, CaseIterable, Codable {
        case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    }
    
    enum CourseType: String, CaseIterable, Codable {
        case course, seminar, laboratory
    }
    
    init(name: String, day: WeekDay, startTime: Date, duration: Int, type: CourseType, room: String, building: String, assetsList: [CourseAssets]) {
        self.name = name
        self.day = day
        self.startTime = startTime
        self.duration = duration
        self.type = type
        self.room = room
        self.building = building
        self.assetsList = assetsList
    }
}

struct Courses: Codable {
    var courses: [Course]
    
    init(courses: [Course]) {
        self.courses = courses
    }
}
