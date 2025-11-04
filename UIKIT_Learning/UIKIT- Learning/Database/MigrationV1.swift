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
            try self.createTaskGroupTable(in: db)
        }
    }
    
    private func createTaskTable(in db: Database) throws {
        try db.create(table: "tasks") { t in
            t.autoIncrementedPrimaryKey("id")
            t.column("title", .text).notNull()
            t.column("createdAt", .datetime).notNull()
            t.column("details", .text)
            t.column("dueDate", .datetime).notNull()
            t.column("isCompleted", .boolean).notNull().defaults(to: false)
            t.column("groupId", .integer)
                .references("task_groups", onDelete: .setNull)

        }
    }
    
    private func createTaskGroupTable(in db: Database) throws {
        try db.create(table: "task_groups") { t in
            t.autoIncrementedPrimaryKey("id")
            t.column("name", .text).notNull()
        }
    }
}
