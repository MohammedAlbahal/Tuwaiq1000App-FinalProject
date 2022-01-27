//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//
import Foundation

extension Date {
    
    var formattedAge: String {
        if let age = Calendar.current.dateComponents([.year], from: self, to: Date()).year {
            return "\(age) years"
        } else {
            return ""
        }
    }
}
