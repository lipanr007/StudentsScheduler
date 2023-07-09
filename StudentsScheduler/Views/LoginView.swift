//
//  LoginView.swift
//  StudentsScheduler
//
//  Created by rares on 01.07.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: UserViewModel
    @State private var username = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    init(viewModel: UserViewModel) { // Add initializer to receive the viewModel
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("Log In")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                viewModel.logIn(username: username,
                                password: password)
                presentationMode.wrappedValue.dismiss()
//                print("login")
            }) {
                Text("Log In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .onAppear {
            viewModel.user = nil
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(viewModel: <#UserViewModel#>)
//    }
//}
