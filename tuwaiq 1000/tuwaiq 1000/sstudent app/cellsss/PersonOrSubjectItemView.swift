//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//

import UIKit

class PersonOrSubjectItemView: UICollectionViewCell {
    @IBOutlet weak var viewFirst: UIView!
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewFirst.layer.cornerRadius = 10.0
        
        viewName.layer.cornerRadius = 10.0
        name.textColor = UIColor (named: "colorClaro")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageCell.image = nil
        name.text = nil
    }
    
    func configure(with personsSubjects: DefaultData){
        imageCell.image = UIImage(named: personsSubjects.photo)
        name.text = personsSubjects.name
    }
}
