//
//  SplashView.swift
//  StudentsScheduler
//
//  Created by rares on 12.03.2023.
//

import SwiftUI

struct SplashView: View {
    @StateObject var viewModel = SplashViewModel()

    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView("Student's scheduler loading...")
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
            } else {
                NavigationLink(destination: HomeView(viewModel: HomeViewModel()), isActive: $viewModel.isNavigationActive) {
                    EmptyView()
                }
            }
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}




struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
