

import UIKit

protocol popupControllerDelegate: NSObjectProtocol {
    func setReminder(event: Event)
}

class PopUpController: UIViewController {

    @IBOutlet weak var personPic: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet weak var reminderButton: UIButton!
    
    var event: Event!
    weak var delegate: popupControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.layer.cornerRadius = 15
        popUpView.layer.masksToBounds = true
        
        personPic.layer.cornerRadius = 45
        personPic.layer.masksToBounds = true
        
        eventTitle.lineBreakMode = .byWordWrapping
        eventTitle.numberOfLines = 0
        
        eventTitle.text = event.title
        eventTime.text = event.time
        personPic.image = event.personPic
        eventLocation.text = event.location
        
        if(event.reminder) {
            reminderButton.isHidden = false
        } else {
            reminderButton.isHidden = true
        }
    }
    
    @IBAction func reminderClicked(_ sender: Any) {
        if !event.reminder {
            event.reminder = true
            reminderButton.isHidden = false
        } else {
            event.reminder = false
            reminderButton.isHidden = true
        }
    }
 
        
    @IBAction func exitPopUpClicked(_ sender: Any) {
        if let delegate = delegate {
                delegate.setReminder(event: event)
        }
        
        dismiss(animated: true, completion: nil)
        
    }
}
