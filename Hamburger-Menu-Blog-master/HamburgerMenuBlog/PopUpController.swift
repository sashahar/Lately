

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
    @IBOutlet weak var locationPic: UIImageView!
    
    @IBOutlet weak var reminderButton: UIButton!
    
    @IBOutlet weak var unsetReminderButton: UIButton!
    var event: Event!
    weak var delegate: popupControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.layer.cornerRadius = 15
        popUpView.layer.masksToBounds = true
        
        personPic.layer.cornerRadius = personPic.frame.size.width / 2
        personPic.layer.masksToBounds = true
        
        eventTitle.lineBreakMode = .byWordWrapping
        eventTitle.numberOfLines = 0
        
        eventTitle.text = event.title
        eventTime.text = event.time
        personPic.image = event.personPic
        locationPic.image = event.locationPic
        locationPic.layer.cornerRadius = 5
        locationPic.layer.masksToBounds = true
        eventLocation.text = event.location
        
        if(event.reminder) {
            reminderButton.isHidden = false
            unsetReminderButton.isHidden = true
        } else {
            reminderButton.isHidden = true
            unsetReminderButton.isHidden = false
        }
    }
    
    @IBAction func reminderClicked(_ sender: Any) {
        if !event.reminder {
            event.reminder = true
            reminderButton.isHidden = false
            unsetReminderButton.isHidden = true
        } else {
            event.reminder = false
            reminderButton.isHidden = true
            unsetReminderButton.isHidden = false
        }
    }
 
    @IBAction func unsetReminderClicked(_ sender: Any) {
        if !event.reminder {
            event.reminder = true
            reminderButton.isHidden = false
            unsetReminderButton.isHidden = true
        } else {
            event.reminder = false
            reminderButton.isHidden = true
            unsetReminderButton.isHidden = false
        }
    }
    
    @IBAction func exitPopUpClicked(_ sender: Any) {
        if let delegate = delegate {
                delegate.setReminder(event: event)
        }
        
        dismiss(animated: true, completion: nil)
        
    }
}
