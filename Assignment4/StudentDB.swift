//
//  StudentDB.swift
//  Assignment3
//
//  Created by Omry Dabush on 17/12/2016.
//  Copyright © 2016 Omry Dabush. All rights reserved.
//

import Foundation

class StudentDB {
    
    
    static let sharedInstance =  StudentDB()
    private var students = [Student]()
    
    private init() {
        //First Student Init
        students = {
            let student1 = Student()
            student1.studetName = "David"
            student1.studentLastName = "Davidi"
            student1.studentID = "201494051"
            student1.studentPhone = "0501234567"
            let student2 = Student()
            student2.studetName = "Omry"
            student2.studentLastName = "Dabush"
            student2.studentID = "201494051"
            student2.studentPhone = "0501234567"
            return [student1, student2]
        }()
    }
    
    
    
    func addStudent (student:Student){
        students.append(student)
    }
    
    func getStudent(id : String) -> Student?{
        for stud in students {
            if (stud.studentID == id){
                return stud
            }
        }
        return nil
    }
    
    func deleteStudent(id : String){
        for (index,stud) in students.enumerated() {
            if (stud.studentID == id){
                students.remove(at: index)
                return
            }
        }
    }
    
    
    func updateStudent(student:Student){
        for stud in students {
            if (stud.studentID == student.studentID){
                deleteStudent(id: stud.studentID!)
                addStudent(student: student)
            }
        }
    }
    
    func numOfStudents () -> Int{
        return self.students.count
    }
    
    func pullStudent(indexPath: IndexPath)-> Student{
        return self.students[indexPath.item]
    }
    
}




