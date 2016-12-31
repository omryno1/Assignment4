//
//  StudentTableViewController.swift
//  Assignment3
//
//  Created by Omry Dabush on 17/12/2016.
//  Copyright © 2016 Omry Dabush. All rights reserved.
//

import UIKit

class StudentTableViewController : UIViewController , UITableViewDataSource, UITableViewDelegate , AddStudentDelegate {
    

    @IBOutlet weak var mainTableView: UITableView!
    
    var studentsDB = StudentDB.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainTableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        if editing {
            if editButtonItem.title == "Edit"{
                self.mainTableView.setEditing(true, animated: true)
                editButtonItem.title = "Done"
            }else{
                self.mainTableView.setEditing(false, animated: true)
                editButtonItem.title = "Edit"
            }
        }
        
    }
    
    
    @IBAction func addStudenButtonWasPressed(_ sender: UIBarButtonItem) {
        let addStudentVC = storyboard?.instantiateViewController(withIdentifier: "addStudentVC") as? AddStudentController
        addStudentVC?.studentDelegate = self
        self.navigationController?.show(addStudentVC!, sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsDB.numOfStudents()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "student") as! TableViewCell
        cell.student = studentsDB.pullStudent(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let studentDetailsVC = storyboard?.instantiateViewController(withIdentifier: "detailsVC") as! StudentDetailsViewController
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        studentDetailsVC.student = cell.student!
        self.navigationController?.show(studentDetailsVC, sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteStudent(indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func addStudent(student: Student) {
        studentsDB.addStudent(student: student)
        mainTableView.reloadData()
    }
    
    func deleteStudent(indexPath: IndexPath) {
        let stutdentToDelete = studentsDB.pullStudent(indexPath: indexPath)
        studentsDB.deleteStudent(id: stutdentToDelete.studentID!)
        mainTableView.reloadData()
    }
}

