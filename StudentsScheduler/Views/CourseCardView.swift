//
//  CourseCardView.swift
//  StudentsScheduler
//
//  Created by rares on 11.04.2023.
//

import SwiftUI

import SwiftUI

struct CourseCardView: View {
    @StateObject var viewModel: CourseCardViewModel
    
    init(course: Course) {
        _viewModel = StateObject(wrappedValue: CourseCardViewModel(course: course))
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(viewModel.name)
                .font(.headline)
                .foregroundColor(.blue)
            
            Image(systemName: viewModel.icon)
                .font(.system(size: 25))
            
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                .frame(width: 150, height: 200)
        )
    }
}
