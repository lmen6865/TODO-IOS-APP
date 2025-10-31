//
//  ReminderViewController+Section.swift
//  Today
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-27.
//

import Foundation

extension ReminderViewController {
    enum Section: Int, Hashable {
        case view
        case title
        case date
        case notes


        var name: String {
            switch self {
            case .view: return ""
            case .title:
                return NSLocalizedString("Title", comment: "Title section name")
            case .date:
                return NSLocalizedString("Date", comment: "Date section name")
            case .notes:
                return NSLocalizedString("Notes", comment: "Notes section name")
            }
        }
    }
}
