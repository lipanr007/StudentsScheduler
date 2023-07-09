//
//  CalendarViewModel.swift
//  StudentsScheduler
//
//  Created by rares on 11.04.2023.
//

import SwiftUI
import Combine

final class CalendarViewModel: ObservableObject {
    @Published var currentDate: Date
    @Published var selectedDate: Date?
    @Published var isSelected: Bool
    @Published var deadlinesByDate = [Date: [Deadline]]()

    private let calendar = Calendar.current

    private var cancellables = Set<AnyCancellable>()

    init() {
        currentDate = Date()
        isSelected = false
    }

    var currentMonthDates: [Date] {
        let monthRange = calendar.range(of: .day, in: .month, for: currentDate)!
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: currentDate))!
        let startIndex = calendar.component(.weekday, from: startOfMonth) - 1
        let firstDate = calendar.date(byAdding: .day, value: -startIndex, to: startOfMonth)!

        var monthDates: [Date] = []
        for day in 0..<monthRange.count {
            monthDates.append(calendar.date(byAdding: .day, value: day, to: firstDate)!)
        }
        return monthDates
    }

    func nextMonth() {
        currentDate = calendar.date(byAdding: .month, value: 1, to: currentDate)!
    }

    func previousMonth() {
        currentDate = calendar.date(byAdding: .month, value: -1, to: currentDate)!
    }

    func fetchCourseAssets() {
        if let url = Bundle.main.url(forResource: "CourseAssets", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let courseAssets = try JSONDecoder().decode(CourseAssets.self, from: data)
                for courseAsset in courseAssets.courseAssets {
                    let deadlines = courseAsset.deadlines
                    for deadline in deadlines {
                        let day = Calendar.current.startOfDay(for: deadline.day)
                        if var existingDeadlines = deadlinesByDate[day] {
                            existingDeadlines.append(deadline)
                            deadlinesByDate[day] = existingDeadlines
                        } else {
                            deadlinesByDate[day] = [deadline]
                        }
                    }
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
    }

    func selectDate(date: Date) {
        isSelected = true
        selectedDate = date
    }
}
