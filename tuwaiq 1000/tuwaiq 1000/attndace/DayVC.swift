//  tuwaiq 1000
//
//  Created by M.Al-qhtani on 07/05/1443 AH.
//
import Foundation
import FirebaseFirestore

struct Day {
    let id: String
    let timestamp: Timestamp
    var pStudents: Array<String>
    
    func getNiceDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: timestamp.dateValue())
    }
}
