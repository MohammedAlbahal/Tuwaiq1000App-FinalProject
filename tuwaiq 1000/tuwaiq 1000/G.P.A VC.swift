//
//  G.P.A VC.swift
//  tuwaiq 1000
//
//  Created by saja Al-qhtani on 07/05/1443 AH.
//

import Foundation
import UIKit
//
//extension UIViewController {
//
//    func setupGradientLayer() -> CAGradientLayer {
//        let gradient = CAGradientLayer()
//        let firstColor = ThemeColor.mainColor.cgColor
//        let thirdColor = ThemeColor.thirdColor.cgColor
//        gradient.colors = [firstColor,thirdColor]
//        gradient.locations = [0, 1]
//        return gradient
//    }
//    func setupRedGradientLayer() -> CAGradientLayer {
//        let gradient = CAGradientLayer()
//        let firstColor = UIColor(red:0.92, green:0.36, blue:0.33, alpha:1.00).cgColor
//        let thirdColor = UIColor(red:0.89, green:0.15, blue:0.11, alpha:1.00).cgColor
//        gradient.colors = [firstColor,thirdColor]
//        gradient.locations = [0, 1]
//        return gradient
//    }
//}
extension UIImageView {
    func setupRedGradientLayer() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        let firstColor = UIColor(red:0.92, green:0.36, blue:0.33, alpha:1.00).cgColor
        let thirdColor = UIColor(red:0.89, green:0.15, blue:0.11, alpha:1.00).cgColor
        gradient.colors = [firstColor,thirdColor]
        gradient.locations = [0, 1]
        return gradient
    }
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

