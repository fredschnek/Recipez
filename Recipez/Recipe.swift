//
//  Recipe.swift
//  Recipez
//
//  Created by Frederico Schnekenberg on 24/12/15.
//  Copyright © 2015 Frederico Schnekenberg. All rights reserved.
//

import UIKit
import CoreData
import Foundation


class Recipe: NSManagedObject
{
    // MARK: --- Class Functions ---
    func setRecipeImage(image: UIImage)
    {
        let data = UIImagePNGRepresentation(image)
        self.image = data
    }
    
    func getRecipeImage() -> UIImage
    {
        let image = UIImage(data: self.image!)!
        return image
    }
}
