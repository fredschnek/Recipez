//
//  ViewController.swift
//  Recipez
//
//  Created by Frederico Schnekenberg on 24/12/15.
//  Copyright © 2015 Frederico Schnekenberg. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    // MARK: --- Properties ---
    var recipes = [Recipe]()
    
    // MARK: --- IBOutlets ---
    @IBOutlet weak var tableView : UITableView!
    
    // MARK: --- VC Lifecycle ---
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "img-header"))
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        FetchAndSetResults()
        tableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // configure the navbar tint color and space between navbar and tableview
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = false
        
        // connect the TableView
        tableView.dataSource = self
        tableView.delegate   = self
    }
    
    // MARK: --- CoreData Functions ---
    func FetchAndSetResults()
    {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.recipes = results as! [Recipe]
        }
        catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    // MARK: --- TableView Protocol Functions ---
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return recipes.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as? RecipeCell {
            let recipe = recipes[indexPath.row]
            cell.configureCell(recipe)
            return cell
        }
        else {
            return RecipeCell()
        }
    }
}