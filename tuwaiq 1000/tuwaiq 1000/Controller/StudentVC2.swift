//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
import UIKit

class productCollectionViewCell: UICollectionViewCell{
	@IBOutlet weak var procductImage: UIImageView!
	@IBOutlet weak var productPriceLabel: UILabel!
	@IBOutlet weak var productName: UILabel!
    
    func setup(Item : Item){
        procductImage.image = Item.logo
        productPriceLabel.text = Item.name
        productName.text = Item.name
    
    procductImage.layer.cornerRadius = 20
    procductImage.clipsToBounds = true
}
}
