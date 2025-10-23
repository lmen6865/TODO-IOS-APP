//
//  NSPredicate+helper.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-16.
//

import Foundation

extension NSPredicate {
    static let all = NSPredicate(format: "TRUEPREDICATE")
    static let none = NSPredicate(format: "FALSEPREDICATE")
}
