//
//  TaskGroupViewModel.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-20.
//

import CoreData
import Foundation
import Combine

class TaskGroupViewModel: ObservableObject {
    
    @Published var title: String{
        didSet {
            saveChanges()
        }
    }
    
    init() {
        title = "New Group"
    }
    
    
    
    private var taskGroup: TaskGroupEntity?
    private var context: NSManagedObjectContext?
    
    func setContext(taskGroup: TaskGroupEntity, context: NSManagedObjectContext) {
        self.context = context
        self.taskGroup = taskGroup
        title  = taskGroup.title
    }
    
    private func saveChanges() {
        
        taskGroup?.title = title
    
        do {
            try context?.save()
        } catch {
            print("Failed to save task group: \(error)")
        }
    }
    
    
}
