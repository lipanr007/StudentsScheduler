//
//  AssetsModel.swift
//  StudentsScheduler
//
//  Created by rares on 22.01.2023.
//

import SwiftUI

struct CourseAsset: Codable {
    var notes: [Note]
    var deadlines: [Deadline]
    var homework: [Homework]
    var exams: [Exam]
    var grades: [Grade]
    
    
    init(notes: [Note], deadlines: [Deadline], homework: [Homework], exams: [Exam], grades: [Grade]) {
        self.notes = notes
        self.deadlines = deadlines
        self.homework = homework
        self.exams = exams
        self.grades = grades
    }
}

struct Deadline: Codable, Identifiable {
    var id = UUID()
    var day: Date
    var time: Date
    var courseName: String
    
    init(day: Date, time: Date, subject: String) {
        self.day = day
        self.time = time
        self.courseName = subject
    }
}

struct Note: Codable {
    var title: String
    var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}

struct Homework: Codable {
    var description: String
    var deadline: Deadline
    
    init(description: String, deadline: Deadline){
        self.description = description
        self.deadline = deadline
    }
}

struct Exam: Codable {
    var date: Date
    var grade: Grade
    var status: ExamStatus
    
    enum ExamStatus: String, CaseIterable, Codable {
        case passes, failed
    }
    
    init(date: Date, grade: Grade, status: ExamStatus) {
        self.date = date
        self.grade = grade
        self.status = status
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

struct CourseAssets: Codable {
    var courseAssets: [CourseAsset]
    
    init(courseAssets: [CourseAsset]) {
        self.courseAssets = courseAssets
    }
}
