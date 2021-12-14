//
//  Helper.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 18/04/1443 AH.
//

import UIKit

extension UIViewController {
    
    func setupGradientLayer() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        let firstColor = ThemeColor.mainColor.cgColor
        let thirdColor = ThemeColor.thirdColor.cgColor
        gradient.colors = [firstColor,thirdColor]
        gradient.locations = [0, 1]
        return gradient
    }
    func setupRedGradientLayer() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        let firstColor = UIColor(red:0.92, green:0.36, blue:0.33, alpha:1.00).cgColor
        let thirdColor = UIColor(red:0.89, green:0.15, blue:0.11, alpha:1.00).cgColor
        gradient.colors = [firstColor,thirdColor]
        gradient.locations = [0, 1]
        return gradient
    }
}

extension UITextView {
    
    func calculateLines() -> Int {
        let numberOfGlyphs = layoutManager.numberOfGlyphs
        var index = 0, numberOfLines = 0
        var lineRange = NSRange(location: NSNotFound, length: 0)
        
        while index < numberOfGlyphs {
            layoutManager.lineFragmentRect(forGlyphAt: index, effectiveRange: &lineRange)
            index = NSMaxRange(lineRange)
            numberOfLines += 1
            if text.last == "\n" {
                numberOfLines += 1
            }
        }
        return numberOfLines
    }
    
}
