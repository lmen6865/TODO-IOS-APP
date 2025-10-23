//
//  TaskListViewModel.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-20.
//

import Foundation
import CoreData
import Combine

class TaskListViewModel: ObservableObject {
    @Published var tasks: [TaskEntity] = []
    
    private var context: NSManagedObjectContext?
    private var hasSetContext = false
    
    func setContext(context: NSManagedObjectContext) {
        guard !hasSetContext else { return }
        self.context = context
        hasSetContext = true
        
    }
    
    func fetchTasks(selection: TaskSelection?, searchTerm: String) {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetch()
        
        
        if searchTerm.isEmpty {
            switch selection {
                case .all:
                    request.predicate = nil
                case .done:
                    request.predicate = NSPredicate(format: "isCompleted == true")
                case .upcoming:
                    request.predicate = NSPredicate(format: "isCompleted == false")
                case .list(let group):
                    request.predicate = NSPredicate(format: "group == %@", group as CVarArg)
                case nil:
                    request.predicate = nil
            }
        } else {
            request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchTerm)
        }
        
        do {
            if let fetchedTasks = try context?.fetch(request) {
                tasks = fetchedTasks
            }
        } catch {
            print("Fetch failed: \(error)")
        }

    }
}
