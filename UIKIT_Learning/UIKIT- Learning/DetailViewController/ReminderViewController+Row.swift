//
//  ReminderViewController+Row.swift
//  Today
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-26.
//

import UIKit


extension ReminderViewController {
    
    nonisolated
    enum Row: Hashable {
        case header(String)
        case date
        case notes
        case time
        case title
        case editableText(String)
        case editableDate(Date)


        var imageName: String? {
            switch self {
            case .date: return "calendar.circle"
            case .notes: return "square.and.pencil"
            case .time: return "clock"
            default: return nil
            }
        }


        var image: UIImage? {
            guard let imageName else { return nil }
            let configuration = UIImage.SymbolConfiguration(textStyle: .headline)
            return UIImage(systemName: imageName, withConfiguration: configuration)
        }


        var textStyle: UIFont.TextStyle {
            switch self {
            case .title: return .headline
            default: return .subheadline
            }
        }
    }
}
