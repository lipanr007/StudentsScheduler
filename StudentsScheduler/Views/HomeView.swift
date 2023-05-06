//
//  HomeView.swift
//  StudentsScheduler
//
//  Created by rares on 12.03.2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TitleView()
                    
                    Spacer()
                    
                    NavigationLink(destination: UserView(viewModel: UserViewModel())) {
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
                        }
                        
                        AddCourseCardView(viewModel: AddCourseCardViewModel())
                    }
                    .padding(.horizontal)
                }
                
                Divider()
                
                CalendarView(viewModel: CalendarViewModel())
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
            .onAppear {
                viewModel.loadData()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
