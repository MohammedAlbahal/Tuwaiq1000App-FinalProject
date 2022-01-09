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
//    @IBAction func webadd(_ sender: UIButton) {
//      UIApplication.shared.open(URL(string: "https://developer.apple.com/documentation/swift")! as URL, options: [:], completionHandler: nil)
//    }
    @IBAction func Share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [self.Image1.image,self.labels.text], applicationActivities: nil)
           activityVC.popoverPresentationController?.sourceView = self.view
           self.present(activityVC, animated: true, completion: nil)
           
           
           
       }
    @IBAction func addtocart(_ sender:  UIButton) {
        UIApplication.shared.open(URL(string: "https://bootcamp.sa/tuwaiq1000")! as URL, options: [:], completionHandler: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        UIButton.setTitle("My Title", forState: UIControlState.Normal) ??

        
        if selectedpro != nil{
            Name2.text = selectedpro?.namee
//            price2.text = selectedpro?.date
            labels.text = selectedpro?.summmmer
            Image1.image = selectedpro!.imageee
        }
    }
    
}
