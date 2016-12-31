//
//  StudentDetailsViewController.swift
//  Assignment3
//
//  Created by Omry Dabush on 17/12/2016.
//  Copyright © 2016 Omry Dabush. All rights reserved.
//

import UIKit

class StudentDetailsViewController: UIViewController {
    
    var student = Student()
    
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentLastName: UILabel!
    @IBOutlet weak var studentID: UILabel!
    @IBOutlet weak var studentPhone: UILabel!
    @IBOutlet weak var studentProfileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAssets()
        
    }
    func setupAssets(){
        studentName.text = student.studetName
        studentLastName.text = student.studentLastName
        studentID.text = student.studentID
        studentPhone.text = student.studentPhone
        studentProfileImage.image = student.studentProfileImage?.image
        studentProfileImage.layer.cornerRadius = 35
        studentProfileImage.layer.masksToBounds = true
    }
    
}
