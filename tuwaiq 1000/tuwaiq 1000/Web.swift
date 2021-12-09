import Foundation
import UIKit
class WebVC : UIViewController {
  @IBAction func webadd(_ sender: UIButton) {
    UIApplication.shared.open(URL(string: "https://github.com/MohammedAlbahal")! as URL, options: [:], completionHandler: nil)
  }
  @IBAction func webadd2(_ sender: UIButton) {
    UIApplication.shared.open(URL(string: "https://www.joodeskan.sa")! as URL, options: [:], completionHandler: nil)
  }
}
