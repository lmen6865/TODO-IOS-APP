//
//  Reminder+EKReminder.swift
//  Today
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-29.
//

import EventKit
import Foundation


extension Reminder {
    init(with ekReminder: EKReminder) throws {
        guard let dueDate = ekReminder.alarms?.first?.absoluteDate else {
            throw ReminderError.reminderHasNoDueDate
        }
        id = ekReminder.calendarItemIdentifier
        title = ekReminder.title
        self.dueDate = dueDate
        notes = ekReminder.notes
        isComplete = ekReminder.isCompleted
    }
}
