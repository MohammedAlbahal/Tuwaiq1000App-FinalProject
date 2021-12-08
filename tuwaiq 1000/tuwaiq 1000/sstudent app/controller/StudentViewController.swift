//
//  StudentViewController.swift
//  MidiOS
//
//  Created by Bel Cerezo on 3/2/21.
//

import UIKit

class StudentViewController: UIViewController{
    
    
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
        
        tittleLabel.text = "Students"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? PersonInfoViewController,
              let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        if(indexPath.row < defaultStudents.count) {
            let studentSelected = defaultStudents[indexPath.row]
            destination.isStudent = true
            destination.person = studentSelected
            
            let studentSubjects = subjects(for: studentSelected)
            destination.subjects = studentSubjects
            destination.persons = teachers(in: studentSubjects)
            
            
        }
    }
    
    
    private func subjects(for student: Student) -> [Subject] {
        return defaultSubjects.filter { subject in
            return subject.students?.contains { $0.name.compare(student.name) == .orderedSame } ?? false
        }
    }
    
    private func teachers(in subjects: [Subject]) -> [Teacher] {
        // TODO: Obtener los profesores de las asignaturas sin duplicados y devolverlos
        var teachersNorepeat: [Teacher] = []
        // 1. iterar sobre la lista de subject
        // 2. cada asignatura quedarme con la lista de profesores
        for subject in subjects {
          // 3. iterar por cada profesor de cada subject.
          subject.teachers?.forEach { teacher in
            // 4. anotarme los profesores en otra lista.
            // 5. ir a la segunda asignatura y ver si los profesores de esa asignatura ya los tengo anotados.
            // 5a. si ya lo tengo anotado, en mi nueva lista no lo anoto
            let isTeacherRepeat = teachersNorepeat.contains { $0.name.compare(teacher.name) == .orderedSame }
            if (!isTeacherRepeat) {
              teachersNorepeat.append(teacher)
            }
            // 5b. si no lo tengo anotado lo anoto en mi nueva lista
            // 6. Pasar por todas las asignaturas
          }
        }
        // 7. Al final tengo en otra lista la lista de profesores sin repetir
        return teachersNorepeat
      }
    
}


extension StudentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentViewCell") as? StudentViewCell
        
        if(indexPath.row < defaultStudents.count){
            let student = defaultStudents[indexPath.row]
            
            cell?.configure(image: UIImage(named: student.photo ),
                            name: student.name ,
                            email: student.email ?? "",
                            age: student.ageFormatted)
            
        }
        
        return cell ?? UITableViewCell()
        
    }
    
}

