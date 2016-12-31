//
//  TableViewCell.swift
//  Assignment3
//
//  Created by Omry Dabush on 17/12/2016.
//  Copyright © 2016 Omry Dabush. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var studenName: UILabel!
    @IBOutlet weak var studentLastName: UILabel!
    @IBOutlet weak var studentProfileImage: UIImageView!
    
    
    var student : Student?{
        didSet{
            studenName.text = student?.studetName
            studentLastName.text = student?.studentLastName
            if student?.studentProfileImage?.image != nil{
                studentProfileImage.image = student?.studentProfileImage?.image
                studentProfileImage.layer.cornerRadius = 25
                studentProfileImage.layer.masksToBounds = true
            }else{
                studentProfileImage.image = UIImage(named: "add_profile_image")
            }
        }
    }
    
}
