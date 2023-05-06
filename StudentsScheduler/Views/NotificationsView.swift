//
//  NotificationsView.swift
//  StudentsScheduler
//
//  Created by rares on 10.04.2023.
//

import SwiftUI

import SwiftUI

struct NotificationsView: View {
    @ObservedObject var viewModel: NotificationsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.notifications) { notification in
                HStack {
                    VStack(alignment: .leading) {
                        Text(notification.title)
                            .font(.headline)
                        Text(notification.message)
                            .font(.subheadline)
                    }
                    Spacer()
                    Button(action: { viewModel.markAsRead(notification: notification) }) {
                        if notification.isRead {
                            Image(systemName: "checkmark.square.fill")
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: "square")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .shadow(radius: 5)
            }
            .onDelete(perform: viewModel.deleteNotification)
        }
        .navigationTitle("Notifications")
    }
}



struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(viewModel: NotificationsViewModel())
    }
}
