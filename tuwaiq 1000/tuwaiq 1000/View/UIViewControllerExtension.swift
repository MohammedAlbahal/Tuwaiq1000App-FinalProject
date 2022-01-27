//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//


import UIKit

extension UIViewController {
    
    func showAlert(style: UIAlertController.Style, title: String, message: String,
                   onAccept: ((UIAlertAction) -> Void)? = nil,
                   onCancel: ((UIAlertAction) -> Void)? = nil){
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: style)
        
        alert.addAction(UIAlertAction(title: "cancelar",
                                      style: .cancel,
                                      handler: onCancel))
        
        alert.addAction(UIAlertAction(title: "eliminar",
                                      style: .destructive,
                                      handler: onAccept))
        
        present(alert, animated: true)
    }
}
