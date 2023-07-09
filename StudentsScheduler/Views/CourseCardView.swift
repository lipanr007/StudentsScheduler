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
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.black, lineWidth: 2)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .frame(width: 150, height: 200)
        )
    }
}
