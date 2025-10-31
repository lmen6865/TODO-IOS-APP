//
//  MigrationV1.swift
//  UIKIT-Learning
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-30.
//
import GRDB
extension Migrator {
    
    func registerVersion1() throws {
        migrator.registerMigration("v1") { db in
            try self.createTaskTable(in: db)
        }
    }
    
    private func createTaskTable(in db: Database) throws {
        try db.create(table: "tasks") { t in
            t.autoIncrementedPrimaryKey("id")
            t.column("title", .text)
            t.column("dueDate", .datetime).notNull()
            t.column("details", .text)
            t.column("isCompleted", .boolean).notNull().defaults(to: false)
        }
    }
}
