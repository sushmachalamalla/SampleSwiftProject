//
//  Persons.swift
//  SimleSwiftProject
//
//  Created by Sushma Reddy on 5/30/16.
//  Copyright © 2016 Sushma Reddy. All rights reserved.
//

import Foundation
import UIKit

class Persons{
    
    var name: String
    var userName: String
    var email:  String
    var address: String
    var website: String
    var company: String
    var phone: String
    
    //can use singleton pattern as well.Since the project is small, considering the simplicity avoided it
    
    //initialising with a dictionary, to set local variables with downloaded json data
    
    init(dict: NSDictionary) {

        self.name = dict["name"]! as! String
        self.userName = dict["username"]! as! String
        self.email = dict["email"]! as! String
        self.address = dict["address"]!["city"]! as! String
        self.website = dict["website"]! as! String
        self.company = dict["company"]!["name"] as! String
        self.phone = dict["phone"]! as! String
    }
    
    }
