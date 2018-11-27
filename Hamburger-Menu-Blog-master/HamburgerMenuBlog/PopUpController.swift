

import UIKit

class PopUpController: UIViewController {

    @IBOutlet weak var personPic: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.layer.cornerRadius = 15
        popUpView.layer.masksToBounds = true
        
        personPic.layer.cornerRadius = 45
        personPic.layer.masksToBounds = true
        
        eventTitle.text = "TEST";
    }
    
    @IBAction func exitPopUpClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
