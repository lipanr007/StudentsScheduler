//
//  CourseCardViewModel.swift
//  StudentsScheduler
//
//  Created by rares on 11.04.2023.
//

import SwiftUI

class CourseCardViewModel: ObservableObject {
    let course: Course
    
    init(course: Course) {
        self.course = course
    }
    
    var name: String {
        return course.name
    }
    
    var icon: String {
        return "book.circle.fill"
    }
}
