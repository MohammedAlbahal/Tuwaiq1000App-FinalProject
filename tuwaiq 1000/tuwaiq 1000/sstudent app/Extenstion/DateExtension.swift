////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 3/04/1443 AH.
////

import Foundation

extension Date {
    
    var formattedAge: String {
        if let age = Calendar.current.dateComponents([.year], from: self, to: Date()).year {
            return "\(age) años"
        } else {
            return ""
        }
    }
}
