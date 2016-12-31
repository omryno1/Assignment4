//
//  Student.swift
//  Assignment3
//
//  Created by Omry Dabush on 17/12/2016.
//  Copyright © 2016 Omry Dabush. All rights reserved.
//

import UIKit

class Student: NSObject {
    var studetName : String?
    var studentLastName : String?
    var studentID : String?
    var studentPhone : String?
    var studentProfileImage : UIImageView?
    
    override init() {
        studentProfileImage?.image  = UIImage(named: "bulletPoints")
    }
    
}
