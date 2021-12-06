////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////

import UIKit

class Cell1 : UICollectionViewCell {
    
    
    @IBOutlet weak var logop: UIImageView!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var price1: UILabel!
    
    func setup(Item : Item){
        logop.image = Item.logo
        lName.text = Item.name
        price1.text = "\(Item.price1)"
    }
}
