//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//

import UIKit

class SubjectItemViewCell : UICollectionViewCell {
    
//    MARK: IBOutlets
    @IBOutlet weak var viewSubjectCollection: UIView!
    @IBOutlet weak var view2SubjectCollection: UIView!
    @IBOutlet weak var labelSubjectCollection: UILabel!
    @IBOutlet weak var labelYearCollection: UILabel!
    @IBOutlet weak var imageCollection: UIImageView!
    
//    MARK
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewSubjectCollection.layer.cornerRadius = 10.0
        view2SubjectCollection.layer.cornerRadius = 10.0
        
        labelSubjectCollection.textColor = UIColor (named: "color-1")
//        labelYearCollection.textColor = UIColor (named: "colorClaro")
    }
    
//    MARK: - Configure
    func configure(image: UIImage?, subject: String, year: String) {
            imageCollection.image = image
            labelSubjectCollection.text = subject
//            labelYearCollection.text = year
        }
    
    }


