//
//  ViewController.swift
//  dogDataRealm
//
//  Created by ROHIT GUPTA on 2/10/16.
//  Copyright © 2016 ROHIT GUPTA. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dogs : Results<Dog>?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        updateUI()
    }
    
    func updateUI(){
        do {
            let realm = try! Realm()
            
            self.dogs = realm.objects(Dog)
            
        } catch {
            print("There was an error!")
        }
        
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dogs!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let dog = self.dogs![indexPath.row]
        cell.textLabel!.text = "\(dog.name) is \(dog.age) years old!"
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let dog = self.dogs![indexPath.row]
            
            do {
                let realm = try! Realm()
                
                try! realm.write {
                    realm.delete(dog)
                }
                
            } catch {
                print("There was an error!")
            }

            
            updateUI()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

