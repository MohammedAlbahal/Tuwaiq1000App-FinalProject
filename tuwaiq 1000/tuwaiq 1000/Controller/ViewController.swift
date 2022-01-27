//  tuwaiq 1000
//
//  Created by M.Al-qhtani.

import UIKit
var userName: String? {
  get {UserDefaults.standard.object(forKey: "userName") as? String}
}
class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
      setupButtons()
      //locationManager.delegate = self
    }
    func setupButtons() {
      startButton.layer.cornerRadius = 0
    }
    override func viewDidAppear(_ animated: Bool) {
      animateButton()
      // locationManager.requestWhenInUseAuthorization()
      // locationManager.requestLocation()
    }
   @IBAction func startButtonPressed(_ sender: UIButton) {
     sender.pulsate()
      if userName != nil {
        performSegue(withIdentifier: "123", sender: self)
      }
    }
  }

  extension ViewController {
    func animateButton() {
      startButton.alpha = 0
      startButton.isEnabled = false
      UIView.animate(withDuration: 1.7, delay: 1.0, options: .curveEaseIn, animations: {
        self.startButton.alpha = 1
      }, completion: { (finished) in
        self.startButton.isEnabled = true
      })
    }
    }
  extension UIButton {
    func pulsate() {
      let pulse = CASpringAnimation(keyPath: "transform.scale")
      pulse.duration = 0.3
      pulse.fromValue = 0.95
      pulse.toValue = 1
      pulse.autoreverses = true
      pulse.repeatCount = 2
      pulse.initialVelocity = 0.5
      pulse.damping = 1.0
      let fromPoint = CGPoint(x: center.x - 5 , y: center.y)
      let fromValue = NSValue(cgPoint: fromPoint)
      let toPoint = CGPoint(x: center.x - 5 , y: center.y)
      let toValue = NSValue(cgPoint: toPoint)
      pulse.fromValue = fromValue
      pulse.toValue = toValue
      layer.add(pulse, forKey: nil)
    }
  }
  
    




