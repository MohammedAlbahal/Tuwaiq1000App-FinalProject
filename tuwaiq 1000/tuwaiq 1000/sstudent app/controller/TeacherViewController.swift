//
//  TeacherViewController.swift
//  MidiOS
//
//  Created by Bel Cerezo on 3/2/21.
//

import UIKit

class TeacherViewController: UIViewController{
    
    //   MARK: - IBOutlets
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - IBActions
    @IBAction func onSavePressed(_ sender: UIButton){
        print("onSavePressed")
    }
    
    //    MARK: - Lifecycle functions
    override func viewDidLoad(){
        super.viewDidLoad()
        
        tittleLabel.text = "Teachers"
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destination = segue.destination as? PersonInfoViewController,
              let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        if (indexPath.row < defaultTeachers.count){
            destination.person = defaultTeachers[indexPath.row]
            destination.isStudent = false
            
            let teacherSubject = defaultSubjects.filter { (($0.teachers?.contains {$0.name.compare(destination.person?.name ?? "") == .orderedSame}) ?? false)
            }
            
            destination.subjects = teacherSubject
            
            var teacherStudent: [Student] = []
            
            teacherSubject.forEach{ ($0.students?.forEach {student in
                teacherStudent.append(student)
            })
            
            }
            
            destination.persons = teacherStudent
            
        }
        
    }
}

extension TeacherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultTeachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherViewCell") as? TeacherViewCell
        
        if(indexPath.row < defaultTeachers.count){
            let teacher = defaultTeachers[indexPath.row]
            var teacherAge: Int? = nil
            if let age = teacher.age {
                teacherAge = Calendar.current.dateComponents([.year], from: age, to: Date()).year
            }
            
            cell?.configure(image: UIImage(named: teacher.photo),
                            name: teacher.name,
                            email: teacher.email ?? "",
                            age: teacherAge ?? nil)
            
        }
            
        return cell ?? UITableViewCell()
    
    }
    
}

