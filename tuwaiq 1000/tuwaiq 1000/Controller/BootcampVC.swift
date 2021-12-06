////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////
import UIKit

class VC2 : UIViewController {
    
    var selectedpro : Item?
    
    @IBOutlet weak var labels: UILabel!
    @IBOutlet weak var price2: UILabel!
    @IBOutlet weak var Name2: UILabel!
    @IBOutlet weak var Image1: UIImageView!
    
    
    @IBAction func addtocart(_ sender: Any) {
        cart.append(selectedpro!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if selectedpro != nil{
            Name2.text = selectedpro?.name
            price2.text = selectedpro?.price1
            labels.text = selectedpro?.spe
            Image1.image = selectedpro!.logo
            
        }
    }
    
}
