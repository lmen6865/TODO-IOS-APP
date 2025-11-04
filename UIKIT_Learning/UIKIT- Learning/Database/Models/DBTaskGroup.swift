//
//  DBTaskGroup.swift
//  UIKIT-Learning
//
//  Created by Menikdiwela, Lahiru 588 on 2025-11-03.
//
import Foundation
import GRDB


struct DBTaskGroup: MutablePersistableRecord, FetchableRecord, Identifiable, Codable {
    
    public var id: Int64?
    var name: String
    
    mutating func didInsert(_ inserted: InsertionSuccess) {
        id = inserted.rowID
    }
    
    
}
extension DBTaskGroup: TableRecord {
    public static let databaseTableName: String = "task_groups"
    
    public static let tasks = hasMany(DBTask.self)
}
