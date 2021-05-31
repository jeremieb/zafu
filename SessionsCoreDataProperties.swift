//
//  SessionsCoreDataProperties.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 31/05/2021.
//

import Foundation
import CoreData

extension Sessions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sessions> {
        return NSFetchRequest<Sessions>(entityName: "Sessions")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String
    @NSManaged public var duration: Int16
    @NSManaged public var icon: String
    @NSManaged public var color: String

}

extension Sessions : Identifiable {

}

