//
//  SignInView.swift
//  StudentsScheduler
//
//  Created by rares on 01.07.2023.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel: UserViewModel
    @State private var username = ""
    @State private var password = ""
    @State private var homeAddress = ""
    @State private var universityAddress = ""
    @Environment(\.presentationMode) var presentationMode
    
    init(viewModel: UserViewModel) { // Add initializer to receive the viewModel
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Home Address", text: $homeAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("University Address", text: $universityAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                signIn()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Sign Up")
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
    
    
    private func signIn() {
        let newUser = User(username: username, password: password, homeAddress: homeAddress, universityAddress: universityAddress, courses: [])
        viewModel.signIn(user: newUser)
//        print("sing in")
    }
}

//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView()
//    }
//}
