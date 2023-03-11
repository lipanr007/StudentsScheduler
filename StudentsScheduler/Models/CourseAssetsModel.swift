//
//  AssetsModel.swift
//  StudentsScheduler
//
//  Created by rares on 22.01.2023.
//

import Foundation

struct CourseAssets: Codable {
    var notes: [String]
    var deadlines: [Deadline]
    var grades: [Grade]
    
    init(notes: [String], deadlines: [Deadline], grades: [Grade]) {
        self.notes = notes
        self.deadlines = deadlines
        self.grades = grades
    }
}

class Deadline: Codable {
    var day: Date
    var time: Date
    var subject: String
    
    init(day: Date, time: Date, subject: String) {
        self.day = day
        self.time = time
        self.subject = subject
    }
}

struct Grade: Codable {
    var day: Date
    var mark: Double
    
    init(day: Date, mark: Double) {
        self.day = day
        self.mark = mark
    }
}
