//
//  TeacherViewCell.swift
//  MidiOS
//
//  Created by Bel Cerezo on 3/2/21.
//

import UIKit

class TeacherViewCell: UITableViewCell{
//   MARK: - IBOutlets
        @IBOutlet weak var viewCellDos: UIView!
        @IBOutlet weak var imageTeacherCell: UIImageView!
        @IBOutlet weak var nameTeacherCell: UILabel!
        @IBOutlet weak var emailTeacherCell: UILabel!
        @IBOutlet weak var workTeacherCell: UILabel!
    
//    MARK: - Lifecycle functions
    
        override func prepareForReuse() {
            super.prepareForReuse()
            
            imageTeacherCell.image = nil
            nameTeacherCell.text = nil
            emailTeacherCell.text = nil
            workTeacherCell.text = nil
            

        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageTeacherCell.layer.masksToBounds = true
        imageTeacherCell.layer.cornerRadius = imageTeacherCell.frame.height / 2
        
        viewCellDos.layer.cornerRadius = 8.0
        viewCellDos.showShadow()
        
    }
    
    //    MARK: - Configure
    func configure(image: UIImage?, name: String, email: String, age: Int?) {
        imageTeacherCell.image = image
        nameTeacherCell.text = name
        emailTeacherCell.text = email
        if let teacherAge = age {
            workTeacherCell.text = "Edad: \(teacherAge)"
        }
        
    }
}
