//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//

import Foundation
import UIKit


class TabbsVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        
        viewControllers = [
            StudentsssVC(),
            DaysssVC()
        ]
    }
}
