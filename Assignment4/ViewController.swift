//
//  ViewController.swift
//  Assignment4
//
//  Created by Omry Dabush on 30/12/2016.
//  Copyright © 2016 Omry Dabush. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ReturnToHomeDelegate{

//    var studentTableVC: UIViewController!
//    var aboutVC: UIViewController!
//    var addStudentImageVC: UIViewController!

    
    var viewControllers : [UIViewController]!
    
    
    var selectedIndex: Int = 0
    
    @IBOutlet weak var centerButtonUIView: UIView!
    
    @IBOutlet weak var contantView: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func didPressTab(_ sender: UIButton) {
            
            let previousIndex = selectedIndex
            selectedIndex = sender.tag
            
            buttons[previousIndex].isSelected = false
            
            let previousVC = viewControllers[previousIndex]
            previousVC.willMove(toParentViewController: nil)
            previousVC.view.removeFromSuperview()
            previousVC.removeFromParentViewController()
            
            sender.isSelected = true
            
            let vc = viewControllers[selectedIndex]
            addChildViewController(vc)
            
            vc.view.frame = contantView.bounds
            contantView.addSubview(vc.view)
            vc.didMove(toParentViewController: self)

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let studentTableVC = storyboard?.instantiateViewController(withIdentifier: "studentsTableVC")
        let aboutVC = storyboard?.instantiateViewController(withIdentifier: "aboutVC")
        let addStudentImageVC = storyboard?.instantiateViewController(withIdentifier: "addImage") as! AddStudentWithImageController
        let nav = UINavigationController(rootViewController: addStudentImageVC)
        let addStudentVC = storyboard?.instantiateViewController(withIdentifier: "addStudentVC") as! AddStudentController
        
        addStudentVC.tabBarVC = self
        addStudentVC.returnToHomeDelegate = self
        addStudentImageVC.addStudenVC = addStudentVC
        
        viewControllers = [studentTableVC!,aboutVC!,nav]
        
        configuerAssests()
    }

    func configuerAssests(){
        centerButtonUIView.layer.zPosition = 1
        centerButtonUIView.layer.cornerRadius = 75
        
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
        

    }
    

    func returnToHome() {
        selectedIndex = 0
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
    }
    

}

