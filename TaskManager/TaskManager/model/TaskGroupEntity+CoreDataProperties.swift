//
//  TaskGroupEntity+CoreDataProperties.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-16.
//
//

public import Foundation
public import CoreData


public typealias TaskGroupEntityCoreDataPropertiesSet = NSSet

extension TaskGroupEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskGroupEntity> {
        return NSFetchRequest<TaskGroupEntity>(entityName: "TaskGroupEntity")
    }

    @NSManaged public var title_: String?
    @NSManaged public var uuid_: UUID?
    @NSManaged public var creationDate_: Date?
    @NSManaged public var tasks_: NSSet?
    


}

extension TaskGroupEntity {
    
    var uuid : UUID {
        uuid_ ?? UUID()
    }
    
    var title: String {
        get { title_ ?? "Untitled" }
        set {title_ = newValue}
    }
    
    var creationDate: Date {
        creationDate_ ?? Date()
    }
    
    var tasks: Set<TaskEntity> {
        get { tasks_ as? Set<TaskEntity> ?? [] }
        set { tasks_ = newValue as NSSet }
    }
    
    convenience init(title: String, context: NSManagedObjectContext) {
            self.init(context: context)
            self.title = title
    }
    
    
    public override nonisolated func awakeFromInsert() {
        super.awakeFromInsert()
        MainActor.assumeIsolated {
            self.uuid_ = UUID()
            self.creationDate_ = Date()
        }
    }
    
    static func delete(taskGroup: TaskGroupEntity) {
        guard let context = taskGroup.managedObjectContext else { return }
        context.delete(taskGroup)
    }
    
   
    static func fetch(_predicate: NSPredicate = .all) -> NSFetchRequest<TaskGroupEntity> {
        let request = TaskGroupEntity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskGroupEntity.title_, ascending: true),
                                   NSSortDescriptor(keyPath: \TaskGroupEntity.creationDate_, ascending: true)]
        request.predicate = _predicate
        return request
    }
    
    static var example: TaskGroupEntity {
        let context = PersistenceController.preview.container.viewContext
        let taskGroup = TaskGroupEntity(title: "Example Group1", context: context)
        taskGroup.tasks.insert(TaskEntity.example)
        return taskGroup
    }
}

// MARK: Generated accessors for tasks_
extension TaskGroupEntity {

    @objc(addTasks_Object:)
    @NSManaged public func addToTasks_(_ value: TaskEntity)

    @objc(removeTasks_Object:)
    @NSManaged public func removeFromTasks_(_ value: TaskEntity)

    @objc(addTasks_:)
    @NSManaged public func addToTasks_(_ values: NSSet)

    @objc(removeTasks_:)
    @NSManaged public func removeFromTasks_(_ values: NSSet)

}

extension TaskGroupEntity : Identifiable {
    public var id: UUID {
        self.uuid
    }
}
