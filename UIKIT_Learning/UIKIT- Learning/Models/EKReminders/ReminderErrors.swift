//
//  ReminderErrors.swift
//  Today
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-29.
//

import Foundation


enum ReminderError: LocalizedError {

    case accessDenied
    case accessRestricted
    case failedReadingCalendarItem
    case failedReadingReminders
    case reminderHasNoDueDate
    case unknown


    var errorDescription: String? {
        switch self {
        case .accessDenied:
            return NSLocalizedString("The app doesn't have permission to read reminders.", comment: "access denied error description")
        case .accessRestricted:
            return NSLocalizedString("This device doesn't allow access to reminders.", comment: "access restricted error description")
        case .failedReadingCalendarItem:
            return NSLocalizedString(
                "Failed to read a calendar item.", comment: "failed reading calendar item error description"
            )
        case .failedReadingReminders:
            return NSLocalizedString(
                "Failed to read reminders.", comment: "failed reading reminders error description")
        
        case .reminderHasNoDueDate:
            return NSLocalizedString("A reminder has no due date.", comment: "reminder has no due date error description")
        case .unknown:
            return NSLocalizedString("An unknown error occurred.", comment: "unknown error description")
        
        }
    }
}
