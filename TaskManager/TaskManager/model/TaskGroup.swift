////
////  TaskGroup.swift
////  TaskManager
////
////  Created by Menikdiwela, Lahiru 588 on 2025-10-16.
////
//
//import Foundation
//import CoreData
//
//extension TaskGroupEntity {
//    
//    var title: String {
//        get { title_ ?? "Untitled" }
//        set {title_ = newValue}
//    }
//    
//    var creationDate: Date {
//        creationDate_ ?? Date()
//    }
//    
//    var tasks: Set<TaskEntity> {
//        get { tasks_ as? Set<TaskEntity> ?? [] }
//        set { tasks_ = newValue as NSSet }
//    }
//    
//    public override func awakeFromInsert() {
//        super.awakeFromInsert()
//        uuid_ = UUID()
//        creationDate_ = Date()
//      
//    }
//    
//    static func delete(taskGroup: TaskGroupEntity) {
//        guard let context = taskGroup.managedObjectContext else { return }
//        context.delete(taskGroup)
//    }
//    
//    static func fetch(_predicate: NSPredicate = .all) -> NSFetchRequest<TaskGroupEntity> {
//        let request = TaskGroupEntity.fetchRequest()
//        request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskGroupEntity.title_, ascending: true),
//                                   NSSortDescriptor(keyPath: \TaskGroupEntity.creationDate_, ascending: true)]
//        request.predicate = _predicate
//        return request
//    }
//    
//    static var example: TaskGroupEntity {
//        let context = PersistenceController.preview.container.viewContext
//        let taskGroup = TaskGroupEntity(context: context)
//        taskGroup.title = "Example Task Group"
//        return taskGroup
//    }
//}
