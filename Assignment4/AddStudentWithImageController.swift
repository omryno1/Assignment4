//
//  AddStudentWithImageController.swift
//  Assignment4
//
//  Created by Omry Dabush on 31/12/2016.
//  Copyright © 2016 Omry Dabush. All rights reserved.
//

import UIKit

class AddStudentWithImageController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,AddStudentDelegate {

    var studentsDB = StudentDB.sharedInstance
    var addStudenVC : AddStudentController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleProfileImagePick()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleProfileImagePick()
    }
    
    func handleProfileImagePick(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Pick A Profile Image", message: "Choose An Image Source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action :UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            }
            print("Camera Not Available")
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action :UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    //implementation of UIImagepickerController Delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            if addStudenVC != nil {
                addStudenVC?.studentDelegate = self
                addStudenVC?.imagePick = pickedImage
                self.navigationController?.show(addStudenVC!, sender: self)
            }

            picker.dismiss(animated: true, completion: nil)
            
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //Implement add student delegate
    
    func addStudent(student: Student) {
        studentsDB.addStudent(student: student)

    }

}
