//
//  AddCourseCardView.swift
//  StudentsScheduler
//
//  Created by rares on 11.04.2023.
//

import SwiftUI

struct AddCourseCardView: View {
    @ObservedObject var viewModel: AddCourseCardViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(Color.black, lineWidth: 2)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
            .frame(width: 150, height: 200)
            .overlay(
                VStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                    
                    Text("Add Course")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.top)
                }
            )
            .onTapGesture {
                viewModel.addCourse()
            }
    }
}

struct AddCourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseCardView(viewModel: AddCourseCardViewModel())
    }
}
