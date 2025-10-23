//
//  TaskSelection.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-16.
//

import Foundation

enum TaskSelection: Identifiable, CaseIterable, Hashable {
    case all
    case done
    case upcoming
    case list(TaskGroupEntity)
    
    var id: String {
        switch self {
        case .all: return "all"
        case .done: return "done"
        case .upcoming: return "upcoming"
        case .list(let group): return group.uuid.uuidString
        }
    }
    
    var displayName: String {
        switch self {
        case .all: return "All"
        case .done: return "Done"
        case .upcoming: return "Upcoming"
        case .list(let group): return group.title
        }
    }
    
    var iconName: String {
        switch self {
        case .all: return "list.dash"
        case .done: return "checkmark"
        case .upcoming: return "calendar"
        case .list: return "list.bullet"
        }
    }
    
    static var allCases: [TaskSelection] {
        [.all, .done, .upcoming]
    }
}
