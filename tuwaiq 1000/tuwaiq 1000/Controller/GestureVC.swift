//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//

import UIKit

class gestureVC : UIViewController {
    
    let imageview = UIImageView()
     let pinchggesture = UIPinchGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageview.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        imageview.image = #imageLiteral(resourceName: "img_student_7")
        imageview.isUserInteractionEnabled = true
        self.view.addSubview(imageview)
        
        imageview.center = view.center
        imageview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        imageview.addGestureRecognizer(pinchggesture)
        pinchggesture.addTarget(self, action: #selector(pinchaction))
    }
    
    
    @objc func pinchaction() {
        
        guard let gestureview = pinchggesture.view else {
            return
        }
        
        gestureview.transform = gestureview.transform.scaledBy(x: pinchggesture.scale, y: pinchggesture.scale)
        pinchggesture.scale = 1
    }
    
}
        
        
        
       
