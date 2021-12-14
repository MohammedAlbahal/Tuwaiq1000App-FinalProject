import Foundation
import UIKit
class WebVC : UIViewController {
  @IBAction func webadd(_ sender: UIButton) {
    UIApplication.shared.open(URL(string: "https://developer.apple.com/documentation/swift")! as URL, options: [:], completionHandler: nil)
  }
  @IBAction func webadd2(_ sender: UIButton) {
    UIApplication.shared.open(URL(string: "https://www.swift.org/documentation/")! as URL, options: [:], completionHandler: nil)
  }
    
    @IBAction func webadd3(_ sender: UIButton) {
      UIApplication.shared.open(URL(string: "https://www.hackingwithswift.com/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func webadd4(_ sender: UIButton) {
      UIApplication.shared.open(URL(string: "https://www.udemy.com/topic/swift/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func webadd5(_ sender: UIButton) {
      UIApplication.shared.open(URL(string: "https://satr.codes")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func webadd6(_ sender: UIButton) {
      UIApplication.shared.open(URL(string: "https://coderhub.sa/challenges")! as URL, options: [:], completionHandler: nil)
    }
}
