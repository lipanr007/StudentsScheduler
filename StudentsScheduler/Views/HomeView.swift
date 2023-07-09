//
//  HomeView.swift
//  StudentsScheduler
//
//  Created by rares on 12.03.2023.
//

import SwiftUI
import Combine

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @StateObject var userViewModel = UserViewModel()
    @StateObject var addCourseViewModel = AddCourseViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TitleView()
                    
                    Spacer()
                    
                    NavigationLink(destination: UserView(viewModel: userViewModel)) {
                        Image(systemName: "person.circle")
                            .font(.system(size: 35))
                    }
                    
                    NavigationLink(destination: NotificationsView(viewModel: NotificationsViewModel())) {
                        Image(systemName: "bell")
                            .font(.system(size: 35))
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(viewModel.courses, id: \.id) { course in
                            CourseCardView(course: course)
                                .padding(.trailing, 60)
                        }
                        
                        NavigationLink(destination: AddCourseView(viewModel: addCourseViewModel)) {
                            AddCourseCardView(viewModel: addCourseViewModel)
                        }
                        .padding(.leading, -40)
                    }
                    .padding(.leading, 50)
                }
                
                Divider()
                
                CalendarView(viewModel: CalendarViewModel())
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
            .padding(.horizontal, 10)
            .onAppear {
                viewModel.loadData()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .environmentObject(userViewModel)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
