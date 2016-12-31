//
//  AddStudentController.swift
//  Assignment3
//
//  Created by Omry Dabush on 17/12/2016.
//  Copyright © 2016 Omry Dabush. All rights reserved.
//

import UIKit

class customLabel: UILabel,Flashable{}
class customaTextField: UITextField,Jitterable{}

class AddStudentController: UIViewController {
    
    var studentDelegate : AddStudentDelegate?
    var returnToHomeDelegate : ReturnToHomeDelegate?
    var tabBarVC : ViewController?
    var imagePick : UIImage?
    
    @IBOutlet weak var studentName: customaTextField!
    @IBOutlet weak var studentLastName: customaTextField!
    @IBOutlet weak var studenID: customaTextField!
    @IBOutlet weak var studentPhone: customaTextField!
    @IBOutlet weak var studentProfileImage: UIImageView!
    
    
    @IBOutlet weak var errorLabel: customLabel!
    
    
    @IBAction func saveButtonWasPressed(_ sender: UIButton) {
        handleAddStudent()
    }
    
    
    @IBAction func clearButtonWasPressed(_ sender: UIButton) {
        self.studentName.text = nil
        self.studentLastName.text = nil
        self.studenID.text = nil
        self.studentPhone.text = nil
    }
    
    func handleAddStudent(){
        if ((self.studentName.text?.isEmpty)! || (self.studentLastName.text?.isEmpty)! || (self.studenID.text?.isEmpty)! || (self.studentPhone.text?.isEmpty)!){
            jitterTextFields()
            errorLabel.flash()
        }else{
            
            let studentToAdd = Student()
            studentToAdd.studetName = self.studentName.text
            studentToAdd.studentLastName = self.studentLastName.text
            studentToAdd.studentID = self.studenID.text
            studentToAdd.studentPhone = self.studentPhone.text
            studentToAdd.studentProfileImage = self.studentProfileImage
            
            if (self.studentDelegate != nil ){
                self.studentDelegate?.addStudent(student: studentToAdd)
            }
            if tabBarVC != nil {
                self.tabBarVC?.returnToHome()
            }
            _ = navigationController?.popViewController(animated: false)

        }
    }
    
    func jitterTextFields(){
        studentName.jitter()
        studentLastName.jitter()
        studenID.jitter()
        studentPhone.jitter()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0.0
        navigationItem.title = "Add Student"
        if imagePick != nil {
            studentProfileImage.image = imagePick
            studentProfileImage.layer.cornerRadius = 35
            studentProfileImage.layer.masksToBounds = true
        }
        
    }
    
    
}
