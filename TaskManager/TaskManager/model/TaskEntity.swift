////
////  Task.swift
////  TaskManager
////
////  Created by Menikdiwela, Lahiru 588 on 2025-10-16.
////
//
//import Foundation
//import CoreData
//
//extension TaskEntity  {
//    
//    var dueDate: Date{
//        get { dueDate_ ?? Date()}
//        set { dueDate_ = newValue }
//    }
//    
//    var subTasks: Set<TaskEntity> {
//        get { (subTasks_ as? Set<TaskEntity>) ?? Set<TaskEntity>) ?? []}
//        set { subTasks_ = newValue as NSSet? }
//    }
//    
//    static func delete(task: TaskEntity) {
//        guard let context = task.managedObjectContext else { return }
//        context.delete(task)
//    }
//    
//    convenience init(context: NSManagedObjectContext, title: String, dueDate: Date) {
//        self.init(context: context)
//        self.title = title
//        self.dueDate = dueDate
//    }
//    
//    public override func awakeFromInsert() {
//        self.uuid_ = UUID()
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//}
