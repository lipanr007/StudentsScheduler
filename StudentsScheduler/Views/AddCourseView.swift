//
//  AddCourseView.swift
//  StudentsScheduler
//
//  Created by rares on 01.05.2023.
//

import SwiftUI

struct AddCourseView: View {
    @StateObject var viewModel: AddCourseViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Course Information")) {
                    TextField("Name", text: $viewModel.name)
                    Picker(selection: $viewModel.day, label: Text("Day")) {
                        ForEach(Course.WeekDay.allCases, id: \.self) { day in
                            Text(day.rawValue.capitalized).tag(day)
                        }
                    }
                    DatePicker(selection: $viewModel.startTime, displayedComponents: [.hourAndMinute]) {
                        Text("Start Time")
                    }
                    Stepper(value: $viewModel.duration, in: 1...4) {
                        Text("Duration: \(viewModel.duration) hour(s)")
                    }
                    Picker(selection: $viewModel.type, label: Text("Type")) {
                        ForEach(Course.CourseType.allCases, id: \.self) { type in
                            Text(type.rawValue.capitalized).tag(type)
                        }
                    }
                }
                
                Section(header: Text("Location")) {
                    TextField("Room", text: $viewModel.room)
                    TextField("Building", text: $viewModel.building)
                }
                
                Section {
                    Button(action: {
                        viewModel.addCourse()
                        presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        Text("Add Course")
                    }
                }
            }
            .navigationTitle("Add Course")
        }
    }
}


struct AddCourseView_Previews: PreviewProvider {
    static var previews: some View {
        AddCourseView(viewModel: AddCourseViewModel())
    }
}
