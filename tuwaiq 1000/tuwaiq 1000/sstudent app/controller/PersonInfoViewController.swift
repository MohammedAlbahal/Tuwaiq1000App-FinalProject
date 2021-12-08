//
//  PersonInfoViewController.swift
//  MidiOS
//
//  Created by Bel Cerezo on 10/2/21.
//

import UIKit

class PersonInfoViewController: UIViewController{
    
    //   MARK: - IBOutlets
    @IBOutlet weak var viewPerson: UIView!
    @IBOutlet weak var imagePerson: UIImageView!
    @IBOutlet weak var namePerson: UILabel!
    @IBOutlet weak var surnamePerson: UILabel!
    @IBOutlet weak var agePerson: UILabel!
    @IBOutlet weak var emailPerson: UILabel!
    @IBOutlet weak var phonePerson: UILabel!
    @IBOutlet weak var addressPerson: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var person: Person? = nil
    var persons: [DefaultData] = []
    var subjects: [Subject] = []
    
    var isStudent: Bool = false
    
    
    //    MARK: - Lifecycle functions
    override func viewDidLoad(){
        super.viewDidLoad()
        
        viewPerson.layer.cornerRadius = 8.0
        viewPerson.showShadow()
        
        imagePerson.image = UIImage(named: person?.photo ?? "")
        namePerson.text = person?.name
        surnamePerson.text = person?.surname
        agePerson.text = person?.ageFormatted
        emailPerson.text = person?.email
        phonePerson.text = person?.phone
        addressPerson.text = person?.address
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PersonInfoViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
            case 0:
                return "Subjects"
            default:
                return isStudent ? "Teachers" : "Students"
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
        let viewCustom: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 30))
        viewCustom.backgroundColor = UIColor.init(named: "color")
        viewCustom.layer.cornerRadius = 8.0
        viewCustom.showShadow()
        
        let headerText: UILabel = UILabel(frame: CGRect(x: 10, y: 5, width: viewCustom.frame.width, height: 20))
        headerText.textColor = UIColor.black
        headerText.text = self.tableView(tableView, titleForHeaderInSection: section)
        viewCustom.addSubview(headerText)
        
        return viewCustom
            
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonInfoViewCell",
                                                 for: indexPath) as? PersonInfoViewCell
        
        switch indexPath.section {
            case 0:
                cell?.configure(data: subjects)
                
                
            default:
                
                cell?.configure(data: persons)
                
        }
        
        return cell ?? UITableViewCell()
        
    }
}

