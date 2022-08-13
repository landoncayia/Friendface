//
//  CachedFriend+CoreDataProperties.swift
//  Friendface
//
//  Created by Landon Cayia on 8/13/22.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var user: CachedUser?
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }
    
    public var wrappedId: String {
        id ?? "Unknown ID"
    }

}

extension CachedFriend : Identifiable {

}
