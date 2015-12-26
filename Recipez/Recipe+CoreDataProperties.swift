//
//  Recipe+CoreDataProperties.swift
//  Recipez
//
//  Created by Frederico Schnekenberg on 24/12/15.
//  Copyright © 2015 Frederico Schnekenberg. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Recipe
{
    @NSManaged var image: NSData?
    @NSManaged var ingredients: String?
    @NSManaged var preparation: String?
    @NSManaged var title: String?
}
