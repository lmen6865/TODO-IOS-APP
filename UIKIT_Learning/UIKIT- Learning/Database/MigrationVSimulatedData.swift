//
//  MigrationSimulatedData.swift
//  UIKIT-Learning
//
//  Created by Menikdiwela, Lahiru 588 on 2025-11-03.
//
import Foundation
import GRDB
extension Migrator {
    
    func registerVersionSimulatedData() throws {
        migrator.registerMigration("addSimulatedData") { db in
            try self.addSimulatedDataToTaskTable(in: db)
            try self.addSimulatedDataToTaskGroupTable(in: db)
        }
    }
    
    private func addSimulatedDataToTaskTable(in db: Database) throws {
        
        var task1 = DBTask(
            id: nil,
            title: "Test Task 1",
            createdAt: Date(),
            details: "Test details 1",
            dueDate: Date(),
            isCompleted: false,
            
        )
        
        var task2 = DBTask(
            id: nil,
            title: "Test Task 2",
            createdAt: Date(),
            details: "Test details 2",
            dueDate: Date().addingTimeInterval(800),
            isCompleted: false,
        )
        
        var task3 = DBTask(
            id: nil,
            title: "Test Task 3",
            createdAt: Date(),
            details: "Test details 3",
            dueDate: Date().addingTimeInterval(3600),
            isCompleted: false,
        )
        
        var task4 = DBTask(
            id: nil,
            title: "Test Task 4",
            createdAt: Date(),
            details: "Test details 4",
            dueDate: Date(),
            isCompleted: false,
            
        )
        
        try task1.insert(db)
        try task2.insert(db)
        try task3.insert(db)
        try task4.insert(db)
        
    }
    
    private func addSimulatedDataToTaskGroupTable(in db: Database) throws {
        
        var group1 = DBTaskGroup(id: nil, name: "Test Group 1")
        var group2 = DBTaskGroup(id: nil, name: "Test Group 2")
            
        try group1.insert(db)
        try group2.insert(db)

        
    }
    
}
    
