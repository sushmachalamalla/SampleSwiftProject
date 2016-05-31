//
//  DetailsViewController.swift
//  SimleSwiftProject
//
//  Created by Sushma Reddy on 5/30/16.
//  Copyright © 2016 Sushma Reddy. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //declaring detail labels
    let nameText = UILabel()
    let emailText = UILabel()
    let mobileText = UILabel()
    let websiteText = UILabel()
    let addressText = UILabel()
    let companyText = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
      //setting custom constraints to labels
      customConstraints()
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    //function assigning values to publicly declared labels
    func assignValues(dictValues: NSDictionary){
        let personInstance = Persons.init(dict: dictValues)
        
        nameText.text = personInstance.name
        emailText.text = personInstance.email
        mobileText.text = personInstance.phone
        websiteText.text = personInstance.website
        addressText.text = personInstance.address
         companyText.text = personInstance.company
        
    }
    
    //function defining constraints
    func customConstraints(){
       
        //custom labels to set titles
        
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = UIColor.blackColor()
        name.font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
        name.text = "UserName"
        
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.textColor = UIColor.blackColor()
        email.font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
        email.text = "Email"
        
        let mobile = UILabel()
        mobile.translatesAutoresizingMaskIntoConstraints = false
        mobile.textColor = UIColor.blackColor()
        mobile.font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
        mobile.text = "Mobile"
        
        let website = UILabel()
        website.translatesAutoresizingMaskIntoConstraints = false
        website.textColor = UIColor.blackColor()
        website.font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
        website.text = "Website"
        
        let address = UILabel()
        address.translatesAutoresizingMaskIntoConstraints = false
        address.textColor = UIColor.blackColor()
        address.font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
        address.text = "Address"
        
        let company = UILabel()
        company.translatesAutoresizingMaskIntoConstraints = false
        company.textColor = UIColor.blackColor()
        company.font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
        company.text = "Company"
        
        view.addSubview(name)
        view.addSubview(email)
        view.addSubview(mobile)
        view.addSubview(website)
        view.addSubview(address)
        view.addSubview(company)
        
        
        //custom labels reflecting the data in json
        
        
        nameText.translatesAutoresizingMaskIntoConstraints = false
        nameText.textColor = UIColor.grayColor()
        nameText .font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
        
        emailText.translatesAutoresizingMaskIntoConstraints = false
        emailText.textColor = UIColor.grayColor()
        emailText.font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
        
        mobileText.translatesAutoresizingMaskIntoConstraints = false
        mobileText.textColor = UIColor.grayColor()
        mobileText.font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
        
        websiteText.translatesAutoresizingMaskIntoConstraints = false
        websiteText.textColor = UIColor.grayColor()
        websiteText.font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
        
        addressText.translatesAutoresizingMaskIntoConstraints = false
        addressText.textColor = UIColor.grayColor()
        addressText.font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
        
        companyText.translatesAutoresizingMaskIntoConstraints = false
        companyText.textColor = UIColor.grayColor()
        companyText.font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
       
        
        view.addSubview(nameText)
        view.addSubview(emailText)
        view.addSubview(mobileText)
        view.addSubview(websiteText)
        view.addSubview(addressText)
        view.addSubview(companyText)
 
        
        let viewsDictionary = ["name":name,"email":email,"mobile":mobile,"website":website,"address":address,"company":company, "nameText":nameText,"emailText":emailText,"mobileText":mobileText,"websiteText":websiteText,"addressText":addressText,"companyText":companyText]
        
        //setting horizontal and vertical constraints
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[name]-15-[nameText]", options: [], metrics: nil, views:viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[email(name)]-15-[emailText]", options: [], metrics: nil, views:viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[mobile(name)]-15-[mobileText]", options: [], metrics: nil, views:viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[website(name)]-15-[websiteText]", options: [], metrics: nil, views:viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[address(name)]-15-[addressText]", options: [], metrics: nil, views:viewsDictionary))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[company(name)]-15-[companyText]", options: [], metrics: nil, views:viewsDictionary))
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-90-[name]-15-[email]-15-[mobile]-15-[website]-15-[address]-15-[company]", options: [], metrics: nil, views: viewsDictionary))
        
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-90-[nameText]-15-[emailText]-15-[mobileText]-15-[websiteText]-15-[addressText]-15-[companyText]", options: [], metrics: nil, views: viewsDictionary))
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

   
}
