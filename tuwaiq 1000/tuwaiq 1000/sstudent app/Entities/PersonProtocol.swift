//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//


import Foundation



protocol DefaultData {
    var photo: String { get set }
    var name: String { get set }
}

protocol Person: DefaultData {
    var ageFormatted: String { get }
    
    var email: String? { get set }
    var surname: String? { get set }
    var phone: String? { get set }
    var address: String? { get set }
}
