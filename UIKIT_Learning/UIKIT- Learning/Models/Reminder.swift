//
//  Reminder.swift
//  Today
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-25.
//

import Foundation


struct Reminder: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var title: String
    var dueDate: Date
    var notes: String? = nil
    var isComplete: Bool = false
    

}

extension [Reminder] {
    func indexOfReminder(withId id: Reminder.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

#if DEBUG
extension Reminder {
    static var sampleData = [
        Reminder(
            title: "test task 1", dueDate: Date().addingTimeInterval(800.0),
            notes: "test"),
        Reminder(
            title: "teat task 2", dueDate: Date().addingTimeInterval(14000.0),
            notes: "test", isComplete: true),
        Reminder(
            title: "test task 3", dueDate: Date().addingTimeInterval(24000.0),
            notes: "test"),
        Reminder(
            title: "test tatsk 4", dueDate: Date().addingTimeInterval(3200.0),
            notes: "test", isComplete: true),
        Reminder(
            title: "test task 5",
            dueDate: Date().addingTimeInterval(60000.0), notes: "test"),
        Reminder(
            title: "test task 6", dueDate: Date().addingTimeInterval(72000.0),
            notes: "test"),
        Reminder(
            title: "test task 7", dueDate: Date().addingTimeInterval(83000.0),
            notes: "test"),
        Reminder(
            title: "test task 8", dueDate: Date().addingTimeInterval(92500.0),
            notes: "test"),
        Reminder(
            title: "test task 9", dueDate: Date().addingTimeInterval(101000.0),
            notes: "test")
    ]
}
#endif
