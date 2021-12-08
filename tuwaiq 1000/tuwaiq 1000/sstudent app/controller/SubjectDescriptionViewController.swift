//
//  SubjectDescriptionViewController.swift
//  MidiOS
//
//  Created by Bel Cerezo on 4/2/21.
//

import UIKit

// 1.- Crear un protocolo con una función para notificar la asignatura que se debe eliminar

protocol DeleteSubject{
    func deleteSubject(subject: Subject?)
}

class SubjectDescriptionViewController: UIViewController{
    
//   MARK: - IBOutlets
    @IBOutlet weak var viewSubject: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var subjectImage: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonDelete: UIButton!
    
    //MARK: - IBActions
    @IBAction func onDeletePressed(_ sender: UIButton) {
        if let subjectName = subject?.name {
            showAlert(style: .alert,
                      title: "Eliminar asignatura",
                      message: "Se va a eliminar la asignatura \(subjectName) de forma permanente",
                      onAccept:  { action in
                        // Eliminar la asignatura 'Subject'
                        // defaultSubjects.removeAll { $0.name == self.subject?.name }
                        
                        // 3.- Notificar al delegado 'delegate' la asignatura que debe eliminar
                        
                        self.delegate?.deleteSubject(subject: self.subject)
                        
                        // Volver a la pantalla anterior
                        self.navigationController?.popViewController(animated: true)
                      })
        }
    }
    
    // MARK: - Properties
    // 2.- Crear una variable 'delegate' que sea del tipo del protocolo creado
    
    var delegate: DeleteSubject? = nil
    
    var subject: Subject? = nil
    

    
    
//    MARK: - Lifecycle functions
    override func viewDidLoad(){
        super.viewDidLoad()
        
        subjectLabel.text = subject?.name
        subjectImage.image = UIImage(named: subject?.photo ?? "")
        
        viewSubject.showShadow()
        
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    

    
}

extension SubjectDescriptionViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let viewCustom: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 30))
        viewCustom.backgroundColor = UIColor.init(named: "color")
        viewCustom.layer.cornerRadius = 8.0
        
        let headerText: UILabel = UILabel(frame: CGRect(x: 10, y: 5, width: viewCustom.frame.width, height: 20))
        headerText.textColor = UIColor.black
        headerText.text = self.tableView(tableView, titleForHeaderInSection: section)
        viewCustom.addSubview(headerText)
        
        return viewCustom
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
            case 0:
                return "Teachers"
            default:
                return "Students"
        }
    }
        
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
            case 0:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "ContainerViewCell") as? ContainerViewCell
                
                cell?.configure(teachers: subject?.teachers ?? [])
                
                return cell ?? UITableViewCell()
            
            default:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "ContainerStudentViewCell") as? ContainerStudentViewCell
                
                cell?.configure(students: subject?.students ?? [])
        
                
                return cell ?? UITableViewCell()
                
        }
    
    }

}




