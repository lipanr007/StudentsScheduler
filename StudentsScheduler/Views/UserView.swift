//
//  UserView.swift
//  StudentsScheduler
//
//  Created by rares on 10.04.2023.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("User Profile")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: viewModel.signOut) {
                    Text("Sign Out")
                }
            }
            .padding()
            
            if let user = viewModel.user {
                VStack(spacing: 20) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 7)
                    
                    Text(user.username)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Button(action: viewModel.updateProfile) {
                        Text("Update Profile")
                    }
                    
                    Button(action: viewModel.changePassword) {
                        Text("Change Password")
                    }
                }
            } else {
                Text("Loading...")
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}
