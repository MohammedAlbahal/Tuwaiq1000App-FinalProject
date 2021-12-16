//  tuwaiq 1000
//
//  Created by M.Al-qhtani.

import UIKit

class Cell1 : UICollectionViewCell {
    
    
    @IBOutlet weak var logop: UIImageView!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var price1: UILabel!
    
    func setup(Item : Item){
        logop.image = Item.logo
        lName.text = Item.name
        price1.text = "\(Item.price1)"
        logop.layer.cornerRadius = 20
        logop.clipsToBounds = true
    }
}
