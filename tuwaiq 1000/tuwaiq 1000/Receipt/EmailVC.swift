////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////
import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    @IBOutlet weak var textFieldTo: UITextField!
    
    @IBOutlet weak var textFieldSubject: UITextField!
    
    @IBOutlet weak var textViewBody: UITextField!
    
    
    func sendEmail() {
       
        
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        mailVC.setToRecipients([])
        mailVC.setSubject("Subject for email")
        mailVC.setMessageBody("hhhh", isHTML: false)

        present(mailVC, animated: true, completion: nil)
    }

    // MARK: - Email Delegate

    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismiss(animated: true, completion: nil)
    }
    @IBAction func buttonHandlerSendEmail(_ sender: Any) {
       
      let mailComposeViewController = configureMailComposer()
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
        }else{
            print("Can't send email")
        }
    }
    func configureMailComposer() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        
        
        
        
        
        mailComposeVC.setToRecipients([self.textFieldTo.text!])
        mailComposeVC.setSubject(self.textFieldSubject.text!)
        mailComposeVC.setMessageBody(self.textViewBody.text!, isHTML: false)
        return mailComposeVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
