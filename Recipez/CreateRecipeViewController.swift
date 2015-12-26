//
//  CreateRecipeViewController.swift
//  Recipez
//
//  Created by Frederico Schnekenberg on 24/12/15.
//  Copyright © 2015 Frederico Schnekenberg. All rights reserved.
//

import UIKit
import CoreData

class CreateRecipeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    // MARK: --- Properties ---
    var imagePicker : UIImagePickerController!
    
    // MARK: --- IBOutlets ---
    @IBOutlet weak var recipeTitle       : UITextField!
    @IBOutlet weak var recipeIngredients : UITextField!
    @IBOutlet weak var recipePreparation : UITextField!
    @IBOutlet weak var recipeImage       : UIImageView!
    
    @IBOutlet weak var recipeAddImage    : UIButton!
    @IBOutlet weak var recipeCreate      : UIButton!
    
    // MARK: --- VC Lifecycle ---
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "img-header"))
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Instanciate and delegate the ImagePicker
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        // Setup the image attributes
        recipeImage.layer.cornerRadius = 5.0
        recipeImage.clipsToBounds = true
    }

    // MARK: --- IBActions ---
    @IBAction func addImage(sender: AnyObject!)
    {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createRecipe(sender: AnyObject!)
    {
        if let title = recipeTitle.text where (title != "" || title != "Recipe Title") {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Recipe", inManagedObjectContext: context)!
            let recipe = Recipe(entity: entity, insertIntoManagedObjectContext: context)
            
            recipe.title = title
            recipe.ingredients = recipeIngredients.text
            recipe.preparation = recipePreparation.text
            recipe.setRecipeImage(recipeImage.image!)
            
            context.insertObject(recipe)            
            do {
                try context.save()
            }
            catch {
                print("Could not save recipe!")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    // MARK: --- ImagePicker Protocol Functions ---
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?)
    {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        recipeImage.image = image
    }
}
