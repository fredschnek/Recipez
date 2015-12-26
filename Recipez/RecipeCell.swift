//
//  RecipeCell.swift
//  Recipez
//
//  Created by Frederico Schnekenberg on 24/12/15.
//  Copyright © 2015 Frederico Schnekenberg. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell
{
    // MARK: --- IBOutlets ---
    @IBOutlet weak var recipeTitle : UILabel!
    @IBOutlet weak var recipeImage : UIImageView!
    
    // MARK: --- Class Initialization ---
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    // MARK: --- Class Functions ---
    func configureCell(recipe: Recipe)
    {
        recipeTitle.text = recipe.title
        recipeImage.image = recipe.getRecipeImage()
    }
}
