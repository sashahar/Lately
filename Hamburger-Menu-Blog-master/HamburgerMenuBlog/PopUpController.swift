

import UIKit

class PopUpController: UIViewController {

    @IBOutlet weak var personPic: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personPic.layer.cornerRadius = 45;
        personPic.layer.masksToBounds = true;
        
        eventTitle.text = "TEST";
    }
    @IBAction func exitPopUpClicked(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil);
        self.navigationController?.popViewController(animated: true);
    }
}
