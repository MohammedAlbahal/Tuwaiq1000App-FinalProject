//
//  G.P.A VC.swift
//  tuwaiq 1000
//
//  Created by saja Al-qhtani on 07/05/1443 AH.
//

import Foundation
import UIKit


extension UIImageView {
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

