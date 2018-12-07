import UIKit
import UserNotifications

@available(iOS 11.0, *)
class FinishChallengeController: UIViewController {

    @IBOutlet weak var finish: UIButton!
    @IBOutlet weak var reward: UIView!
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    reward.layer.cornerRadius = reward.frame.size.width / 2
    reward.layer.shadowColor = UIColor.black.cgColor
    reward.layer.shadowOffset = CGSize(width: 2, height: 2)
    reward.layer.shadowRadius = 5
    reward.layer.shadowOpacity = 0.5
    reward.layer.masksToBounds = false
    
    finish.layer.cornerRadius = 20
    finish.layer.shadowColor = UIColor.black.cgColor
    finish.layer.shadowOffset = CGSize(width: 2, height: 2)
    finish.layer.shadowRadius = 5
    finish.layer.shadowOpacity = 0.5
    finish.layer.masksToBounds = false
    }
    @IBAction func finishClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
