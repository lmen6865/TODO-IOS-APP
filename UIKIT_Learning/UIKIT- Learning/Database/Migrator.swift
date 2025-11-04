//
//  Migrator.swift
//  UIKIT-Learning
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-30.
//

import GRDB


public class Migrator{
    var migrator = DatabaseMigrator();
   
    public init() {
        #if DEBUG
          migrator.eraseDatabaseOnSchemaChange = true
        #endif
    }
    
    public func migrate(_ writer: some DatabaseWriter) throws {
        try registerVersion1()
        try registerVersionSimulatedData()
        try migrator.migrate(writer)
    }
    
}
