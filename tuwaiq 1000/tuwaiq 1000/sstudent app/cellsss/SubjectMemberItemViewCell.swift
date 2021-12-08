//
//  SubjectMemberItemViewCell.swift
//  MidiOS
//
//  Created by Bel Cerezo on 4/2/21.
//

import UIKit

class SubjectMemberItemViewCell : UICollectionViewCell {
    
//    MARK: IBOutlets
    @IBOutlet weak var viewFirstCollection: UIView!
    @IBOutlet weak var viewSecondCollection: UIView!
    @IBOutlet weak var labelNameCollection: UILabel!
    @IBOutlet weak var imageMemberCollection: UIImageView!
    
//    MARK
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewFirstCollection.layer.cornerRadius = 10.0
        viewSecondCollection.layer.cornerRadius = 10.0
        
        labelNameCollection.textColor = UIColor (named: "colorClaro")
    }
    
    override func prepareForReuse() {
        imageMemberCollection.image = nil
        labelNameCollection.text = nil
    }
    
//    MARK: - Configure
    func configure(image: UIImage?, subject: String) {
            imageMemberCollection.image = image
            labelNameCollection.text = subject
        }

}
