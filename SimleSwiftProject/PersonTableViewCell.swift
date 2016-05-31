//
//  PersonTableViewCell.swift
//  SimleSwiftProject
//
//  Created by Sushma Reddy on 5/30/16.
//  Copyright © 2016 Sushma Reddy. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    // creating a custom table view cell
    
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //creating custom labels
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.font = UIFont(name: "HelveticaNeue", size: CGFloat(18))
        contentView.addSubview(nameLabel)
        
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.textColor = UIColor.grayColor()
        emailLabel.font = UIFont(name: "HelveticaNeue", size: CGFloat(14))
        contentView.addSubview(emailLabel)
        
        let viewsDictionary = ["label1":nameLabel,"label2":emailLabel]
        
        //setting horizontal, vertical constraints to labels
        
         contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[label1]|", options: [], metrics: nil, views:viewsDictionary))
         contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[label2]|", options: [], metrics: nil, views:viewsDictionary))
        
        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-8-[label1]-[label2]", options: [], metrics: nil, views: viewsDictionary))
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
