//
//  NotificationsViewModel.swift
//  StudentsScheduler
//
//  Created by rares on 10.04.2023.
//

import SwiftUI

class NotificationsViewModel: ObservableObject {
    
    @Published var notifications: [Notification] = []
    
    func loadNotifications() {
        // Load user's notifications from API or database
        let notifications: [Notification] = [
            Notification(title: "New message", message: "You have received a new message from John.", date: Date()),
            Notification(title: "Reminder", message: "You have an appointment with your advisor at 2 PM today.", date: Date().addingTimeInterval(3600)),
            Notification(title: "Welcome!", message: "Thank you for using our app.", date: Date().addingTimeInterval(-3600))
        ]
        
        self.notifications = notifications
    }
    
    func markAsRead(notification: Notification) {
        // Mark notification as read in API or database
        // Then update the notifications array to reflect the change
        if let index = notifications.firstIndex(where: { $0.id == notification.id }) {
            notifications[index].isRead = true
        }
    }
    
    func deleteNotification(at indexSet: IndexSet) {
            notifications.remove(atOffsets: indexSet)
        }
}

struct Notification: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    var isRead: Bool = false
    let date: Date
}
