//
//  Cell1.swift
//  amazon
//
//  Created by Macbook on 11/03/1443 AH.
//

import UIKit

class CEll111 : UICollectionViewCell {
    
    
    @IBOutlet weak var logop: UIImageView!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var price1: UILabel!
    
    func setup(Item : Iitem){
        logop.image = Item.imageee 
        lName.text = Item.namee
//        price1.text = "\(Item.date)"
    }
}
