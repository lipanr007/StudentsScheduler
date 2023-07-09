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
                if(!notification.isRead) {
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
            }
            .onDelete(perform: viewModel.deleteNotification)
        }
        .navigationTitle("Notifications")
        .onAppear {
            viewModel.notifications = [
                Notification(title: "Exam today", message: "You have CTS Exam today", date: Date.now),
                Notification(title: "Deadline bechelor's thesis", message: "You have to go and present your bachelor's thesis", date: Date.now)
            ]
        }
    }
}



struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(viewModel: NotificationsViewModel())
    }
}
