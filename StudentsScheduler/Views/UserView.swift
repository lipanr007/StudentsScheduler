//
//  UserView.swift
//  StudentsScheduler
//
//  Created by rares on 10.04.2023.
//

import SwiftUI

struct UserView: View {
    @StateObject var viewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.user != nil {
                    UserProfileView(viewModel: viewModel)
                } else {
                    VStack {
                        NavigationLink(destination: LoginView(viewModel: viewModel)) { // Pass the viewModel
                            Text("Login")
                        }
                        .padding(40)
                        
                        NavigationLink(destination: SignInView(viewModel: viewModel)) { // Pass the viewModel
                            Text("Sign In")
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}




struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel: UserViewModel())
    }
}
