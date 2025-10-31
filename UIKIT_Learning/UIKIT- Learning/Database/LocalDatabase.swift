//
//  LocalDatabase.swift
//  UIKIT-Learning
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-30.
//

import Foundation
import GRDB

struct LocalDatabase {

    private let writer: DatabaseWriter

    init(_ writer: DatabaseWriter) throws {
        self.writer = writer
        try migrator.migrate(writer)
    }

    var reader: DatabaseReader {
        writer
    }
}
