//
//  TodoList+CoreDataProperties.swift
//  Learn_Swift
//
//  Created by 선민재 on 2022/04/18.
//
//

import Foundation
import CoreData


extension TodoList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoList> {
        return NSFetchRequest<TodoList>(entityName: "TodoList")
    }

    @NSManaged public var todo: String?
    @NSManaged public var date: Date?
    @NSManaged public var completed: Bool

}

extension TodoList : Identifiable {

}
