////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 3/04/1443 AH.
////


import UIKit

extension UIView {
    
    func showShadow(opacity: Float = 0.5,
                      offset: CGSize = CGSize.zero,
                      color: CGColor = UIColor.darkGray.cgColor){
        
        layer.shadowColor = color
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        
    }
}
