//
//  DBTask.swift
//  UIKIT-Learning
//
//  Created by Menikdiwela, Lahiru 588 on 2025-11-03.
//

import Foundation

import GRDB

public struct DBTask : MutablePersistableRecord, FetchableRecord, Codable, Identifiable {
    
    public var id: Int64?
    
    public var title: String
    
    public var createdAt: Date
    
    public var details: String?
    
    public var dueDate: Date
    
    public var isCompleted = false
    
    
    public mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
  }
    
    
}

extension DBTask: TableRecord {
    
    public static let databaseTableName = "tasks"
    
    private static let group = belongsTo(DBTaskGroup.self)
    
    
}


