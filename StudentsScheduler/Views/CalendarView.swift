//
//  CalendarView.swift
//  StudentsScheduler
//
//  Created by rares on 11.04.2023.
//

import SwiftUI

struct CalendarView: View {
    @ObservedObject var viewModel: CalendarViewModel
    @State private var selectedDate: Date?
    
    private let calendar = Calendar.current
    
    var body: some View {
        ZStack {
            if(viewModel.isSelected) {
                withAnimation {
                    TaskListView
                }
            }
            
            VStack {
                calendarHeader
                
                Divider()
                
                calendarGrid
            }
            .opacity(viewModel.isSelected ? 0 : 1)
            .padding(.horizontal)
        }
    }
    
    private var calendarHeader: some View {
        HStack {
            Text(calendar.component(.year, from: viewModel.currentDate).description)
                .font(.title)
                .bold()
                .foregroundColor(.primary)
            
            Spacer()
            
            Button(action: viewModel.previousMonth) {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.primary)
            }
            
            Button(action: viewModel.nextMonth) {
                Image(systemName: "chevron.right")
                    .font(.title)
                    .foregroundColor(.primary)
            }
        }
    }
    
    private var TaskListView: some View {
        VStack {
            HStack {
                Button("Go back") {
                    withAnimation {
                        viewModel.isSelected = false
                    }
                }
                Text("Today's tasks down below: ")
            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.mint)
                    .opacity(0.3)
                    .frame(width: 350, height: 100)
            )
            .padding(.top, 50)
            
            Spacer()
            
            Text("No tasks for today")
            
            Spacer()
        }
    }
    
    private var calendarGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
            ForEach(Date.daysOfWeek, id: \.self) { day in
                Text(day)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            
            ForEach(viewModel.currentMonthDates, id: \.self) { date in
                CalendarCell(date: date, isSelected: date == selectedDate) // Pass isSelected based on date comparison
                    .onTapGesture {
                        selectedDate = date // Update selectedDate on tap
                        viewModel.selectDate(date: date)
                        
                    }
            }
        }
    }
}

extension Date {
    static var daysOfWeek: [String] {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        return dateFormatter.shortWeekdaySymbols
    }
}

private struct CalendarCell: View {
    let id = UUID()
    let date: Date
    var isSelected: Bool
    
    private let calendar = Calendar.current
    
    var body: some View {
        VStack {
            Text(calendar.component(.day, from: date).description)
                .foregroundColor(isSelected ? .white : .primary)
                .font(.headline)
                .frame(maxWidth: .infinity, minHeight: 40)
                .background(isSelected ? Color.blue : (calendar.isDateInToday(date) ? Color.blue.opacity(0.3) : Color.clear))
                .clipShape(Circle())
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(viewModel: CalendarViewModel())
    }
}

