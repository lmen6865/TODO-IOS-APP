//
//  EKEventStore+AsyncFetch.swift
//  Today
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-29.
//

import EventKit
import Foundation


extension EKEventStore {
    func reminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders {
                    continuation.resume(returning: reminders)
                } else {
                    continuation.resume(throwing: ReminderError.failedReadingReminders)
                }
            }
        }
    }
}
