//
//  Persistence.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-15.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TaskManager")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func save() {
        let context = container.viewContext
        guard context.hasChanges else { return }
        
        do {
            try context.save()
        } catch {
            print("Error saving object")
        }
    }
    
    static let preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for index in 0..<10 {
            let offset = TimeInterval(index * 2)
            let newItem = TaskEntity(title: "test Task \(index)", dueDate: Date(),  context: viewContext)
//            newItem.title = "New Task \(index)"
//            newItem.dueDate = Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * 30 * Double(index)))
            
        }
        for index in 0..<3{
            let newGroup = TaskGroupEntity(title: "test Group \(index)",  context: viewContext)
        }
        
    
//        do {
//            try viewContext.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
        return result
    }()
}
