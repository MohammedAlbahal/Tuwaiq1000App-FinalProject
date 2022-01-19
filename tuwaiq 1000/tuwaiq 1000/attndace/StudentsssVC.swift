//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//

import UIKit

class StudentsssVC: UIViewController {
    var sttudents: Array<Studentsss> = []
    
    lazy var studentsTV: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.delegate = self
        t.dataSource = self
        t.register(UITableViewCell.self, forCellReuseIdentifier: "StudentCell")
        return t
    }()
    
    lazy var addStudentButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(addStudent), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Add", for: .normal)
        b.layer.cornerRadius = 30
        b.clipsToBounds = true
        b.backgroundColor = UIColor(named: "Color")
        b.setTitleColor(UIColor(named: "color-1"), for: .normal)
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StudentsSservice.shared.listenToStudents { newStudents in
            self.sttudents = newStudents
            self.studentsTV.reloadData()
        }
        
        tabBarItem = UITabBarItem(title: "Students", image: UIImage(systemName: "person"), selectedImage: nil)
        self.view.backgroundColor = .brown
        view.addSubview(studentsTV)
        NSLayoutConstraint.activate([
            studentsTV.topAnchor.constraint(equalTo: view.topAnchor),
            studentsTV.leftAnchor.constraint(equalTo: view.leftAnchor),
            studentsTV.rightAnchor.constraint(equalTo: view.rightAnchor),
            studentsTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.addSubview(addStudentButton)
        NSLayoutConstraint.activate([
            addStudentButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            addStudentButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            addStudentButton.widthAnchor.constraint(equalToConstant: 100),
            addStudentButton.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    @objc func addStudent() {
        let newStudentVC = NewwwStudentVC()
        present(newStudentVC, animated: true, completion: nil)
    }
}

extension StudentsssVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sttudents.count
    }
 

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        
        let student = sttudents[indexPath.row]
        
        cell.textLabel?.text = student.name
        
        return cell
    }
}
