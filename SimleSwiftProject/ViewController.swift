//
//  ViewController.swift
//  SimleSwiftProject
//
//  Created by Sushma Reddy on 5/30/16.
//  Copyright © 2016 Sushma Reddy. All rights reserved.
//

import UIKit
import Foundation



class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    //declaring custom tableview and common mutable array to store json objects
    
    var tableView: UITableView  =   UITableView()
    var contents:NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "List" // sets navigation bar title
        
        //customising table view and adding delegates
        
        tableView.frame         =   CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height);
        tableView.delegate      =   self
        tableView.dataSource    =   self
        self.view.addSubview(tableView)
        
        //calling function to connect to network and download json data
        
        connectToNetwork();
     
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contents.count // gives count of rows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //loading custom cell from PersonTableViewCell
        
        let cell = PersonTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "myIdentifier")
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        let personJsonObject = self.contents[indexPath.row] as? NSDictionary
        
        //loading data into Persons data model
        let personInstance = Persons.init(dict: personJsonObject!)
    
        
        cell.nameLabel.text = personInstance.name
        cell.emailLabel .text = personInstance.email
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //getting object at the row selected
        
        let personJsonObject = self.contents[indexPath.row] as? NSDictionary
        
        //preparing and loading new detail view controller
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let destination = storyboard.instantiateViewControllerWithIdentifier("DetailsStoryBoard") as! DetailsViewController
        
        //calling assignValues function and assigning
        destination.assignValues(personJsonObject!)
        navigationController?.pushViewController(destination, animated: true)
    }
    
    //making a network connection using url
    
    func connectToNetwork(){
        
        let url:NSURL? = NSURL(string: "http://jsonplaceholder.typicode.com/users")
        
        //using urlsession to connect to data
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let task = session.dataTaskWithURL(url!) { (data, response, error) in
            if data!.length > 0 && error == nil{
                self.extract_json(data!) // calling function to serialise the data
            }
        }
        
        task.resume()
        
    }
    
    //converting json data to dictionary
    
    func extract_json(jsonData:NSData)
    {
        
        do {
            if let json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? NSArray {
                
                //testItem = (json as? NSArray)!
                
                for (var i = 0; i < json.count ; i++ )
                                {
                                    if let personDetails = json[i] as? NSDictionary
                                    {
                                        //adding dictionary to global array contents
                                        contents.addObject(personDetails)

                                    }
                                }
                
                
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        //reloading the tableview
        do_table_refresh();
    }
    
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

