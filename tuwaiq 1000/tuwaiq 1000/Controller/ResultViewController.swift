//  tuwaiq 1000
//
//  Created by M.Al-qhtani.


import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var lbAnswered: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbAnswered.text = "Answer the questions: \(totalAnswers)"
        lbCorrect.text = "right questions: \(totalCorrectAnswers)"
        lbWrong.text = "wrong questions: \(totalAnswers - totalCorrectAnswers)"
        let score = totalCorrectAnswers*100/totalAnswers
        lbScore.text = "\(score)%"
    }
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
