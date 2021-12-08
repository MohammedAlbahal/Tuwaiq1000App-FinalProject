//
//  StudentViewCell.swift
//  MidiOS
//
//  Created by Bel Cerezo on 3/2/21.
//

import UIKit

class StudentViewCell: UITableViewCell{
//   MARK: - IBOutlets
        @IBOutlet weak var viewCell: UIView!
        @IBOutlet weak var imageStudentCell: UIImageView!
        @IBOutlet weak var nameStudentCell: UILabel!
        @IBOutlet weak var emailStudentCell: UILabel!
        @IBOutlet weak var ageStudentCell: UILabel!
    
//    MARK: - Lifecycle functions
    
        override func prepareForReuse() {
            super.prepareForReuse()
            
            imageStudentCell.image = nil
            nameStudentCell.text = nil
            emailStudentCell.text = nil
            ageStudentCell.text = nil
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        imageStudentCell.layer.masksToBounds = true
        imageStudentCell.layer.cornerRadius = imageStudentCell.frame.height / 2
        
        viewCell.layer.cornerRadius = 8.0
        
        viewCell.showShadow()
    }
    
    //    MARK: - Configure
    func configure(image: UIImage?, name: String, email: String, age: String) {
        imageStudentCell.image = image
        nameStudentCell.text = name
        emailStudentCell.text = email
        ageStudentCell.text = "Edad: \(String(describing: age))"
        
    }
    
    
    
}
