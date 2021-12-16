//  tuwaiq 1000
//
//  Created by M.Al-qhtani.

import Foundation
class Grade:Codable {
    var id:String?
    var name:String?
    var isChecked: Bool = false
    var hour : String?
    var grade : String?
    var point : Double = 0.0
    
}
class dbGrade : Codable {
    var id:Int = 1
    var name: String?
    var result:String?
    var AvgTYpe :Int = 4
    var list : [Grade]?
}
