//
//  VC2.swift
//  amazon
//
//  Created by Macbook on 11/03/1443 AH.
//
import UIKit

class VC22 : UIViewController {
    
    var selectedpro : Iitem?
    
    @IBOutlet weak var labels: UILabel!
    @IBOutlet weak var price2: UILabel!
    @IBOutlet weak var Name2: UILabel!
    @IBOutlet weak var Image1: UIImageView!
    
//
//    @IBAction func addtocart(_ sender: Any) {
//        cart.append(selectedpro!)
//    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if selectedpro != nil{
            Name2.text = selectedpro?.namee
            price2.text = selectedpro?.date
            labels.text = selectedpro?.summmmer
            Image1.image = selectedpro!.imageee
            
        }
    }
    
}
