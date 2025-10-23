//
//  TaskDetailViewModel.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-20.
//

import Foundation
import CoreData
import Combine

class TaskDetailViewModel: ObservableObject {
    @Published var groups: [TaskGroupEntity] = []
    
    private var context: NSManagedObjectContext?
    
    func setContext(_ context: NSManagedObjectContext) {
        self.context = context
        fetchGroups()
    }
    
    private func fetchGroups() {
        guard let context else { return }
        let request: NSFetchRequest<TaskGroupEntity> = TaskGroupEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskGroupEntity.title_, ascending: true)]
        
        do {
            groups = try context.fetch(request)
        } catch {
            print("Failed to fetch groups: \(error)")
        }
    }
}
