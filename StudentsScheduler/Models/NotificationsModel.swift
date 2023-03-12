//
//  NotificationsModel.swift
//  StudentsScheduler
//
//  Created by rares on 12.03.2023.
//

import SwiftUI

struct NotificationItem: Codable {
    var id: UUID
    var title: String
    var body: String
    var date: Date
    var isLocal: Bool
    var isRead: Bool
    
    init(id: UUID = UUID(), title: String, body: String, date: Date, isLocal: Bool, isRead: Bool = false) {
        self.id = id
        self.title = title
        self.body = body
        self.date = date
        self.isLocal = isLocal
        self.isRead = isRead
    }
}

struct NotificationItems: Codable {
    var notifications: [NotificationItem]
    
    init(notifications: [NotificationItem]) {
        self.notifications = notifications
    }
}
