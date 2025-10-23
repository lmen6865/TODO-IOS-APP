//
//  TaskEntity+CoreDataProperties.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-16.
//
//

public import Foundation
public import CoreData


public typealias TaskEntityCoreDataPropertiesSet = NSSet

extension TaskEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
        return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
    }

    @NSManaged public var title_: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var dueDate_: Date?
    @NSManaged public var details_: String?
    @NSManaged public var uuid_: UUID?
    @NSManaged public var group: TaskGroupEntity?
    
    var uuid: UUID {
        uuid_ ?? UUID()
    }
    
    var details: String {
        get { details_ ?? "No Details" }
        set {details_ = newValue}
    }
    
    var dueDate: Date {
        get { dueDate_ ?? Date() }
        set {dueDate_ = newValue}
    }
    
    var title: String {
        get { title_ ?? "New Task" }
        set {title_ = newValue}
    }
    
    var groupNmae: String{
        get {group?.title ?? "Not Assigned to Groups" }
        set {}
        
    }
    
    convenience init(title: String,
                     dueDate: Date,
                     context: NSManagedObjectContext) {
        self.init(context: context)
        self.title = title
        self.dueDate_ = dueDate
    }
    
    public override nonisolated func awakeFromInsert() {
        super.awakeFromInsert()
        MainActor.assumeIsolated {
            self.uuid_ = UUID()
        }
        
    }
    
    static func delete(task: TaskEntity) {
        guard let context = task.managedObjectContext else { return }
        context.delete(task)
    }
    
    static func fetch(_predicate: NSPredicate = .all) -> NSFetchRequest<TaskEntity> {
        let request = TaskEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskEntity.dueDate_, ascending: true)]
        request.predicate = _predicate
        return request
    }
    
    static var example: TaskEntity {
        let context = PersistenceController.preview.container.viewContext
        let task = TaskEntity(title: "Example Task", dueDate: .distantFuture, context: context)
        return task
    }
    
    

}

extension TaskEntity : Identifiable {
    public var id: UUID {
        self.uuid
    }

}
