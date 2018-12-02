
import UIKit
import UserNotifications

@available(iOS 11.0, *)
class HomeController: UIViewController, UICollectionViewDelegate, UNUserNotificationCenterDelegate, popupControllerDelegate {
    
    @IBOutlet var leadingC: NSLayoutConstraint!
    @IBOutlet var trailingC: NSLayoutConstraint!
    @IBOutlet var ubeView: UIView!
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    
    @IBOutlet weak var menu: UIView!
    
    @IBOutlet weak var event1: UIView!
    @IBOutlet weak var event1Title: UILabel!
    @IBOutlet weak var event1TimeUntil: UILabel!
    @IBOutlet weak var event1Time: UILabel!
    @IBOutlet weak var event1Reminder: UIButton!
    @IBOutlet weak var event1ReminderUnset: UIButton!
    
    @IBOutlet weak var event2: UIView!
    @IBOutlet weak var event2Title: UILabel!
    @IBOutlet weak var event2TimeUntil: UILabel!
    @IBOutlet weak var event2Time: UILabel!
    @IBOutlet weak var event2Reminder: UIButton!
    @IBOutlet weak var event2ReminderUnset: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Send ETA Button
    @IBOutlet weak var sendETA: UIButton!
    
    var hamburgerMenuIsVisible = false
    var data: Datasource!
    var eventSource1: Event!
    var eventSource2: Event!
    var createdChallenge: Challenge!
    var voiceUIFlows: [VoiceFlow]!
    
    @IBOutlet weak var stack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if data == nil {
            data = Datasource()
        }
        if createdChallenge != nil {
            data.addChallenge(challenge: createdChallenge)
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "AppIcon")
        imageView.image = image
        navigationItem.titleView = imageView
        
        header.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        header.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        header.layer.shadowOpacity = 1.0
        header.layer.shadowRadius = 5
        header.layer.masksToBounds = false
        
        profilePic.layer.cornerRadius = profilePic.frame.size.width / 2
        profilePic.layer.masksToBounds = true
        
        userName.text = "Bryce Johnson"
        userLocation.text = "Stanford, CA"

        menu.layer.shadowOffset = .zero
        menu.layer.shadowOpacity = 0.4
        menu.layer.shadowRadius = 5
        menu.layer.shadowColor = UIColor.black.cgColor
        
        stack.layer.shadowOffset = .zero
        stack.layer.shadowOpacity = 0.4
        stack.layer.shadowRadius = 5
        stack.layer.shadowColor = UIColor.black.cgColor
        
        event1.layer.backgroundColor = UIColor.white.cgColor
        event1.layer.shadowColor = UIColor.black.cgColor
        event1.layer.shadowOffset = CGSize(width: 1, height: 2)
        event1.layer.shadowOpacity = 0.3
        event1.layer.shadowRadius = 5
        event1.layer.masksToBounds = false
        
        eventSource1 = data.getEvent(index: 0)
        eventSource2 = data.getEvent(index: 1)
        
        if(eventSource1.reminder) {
            event1Reminder.isHidden = false
            event1ReminderUnset.isHidden = true
        } else {
            event1Reminder.isHidden = true
            event1ReminderUnset.isHidden = false
        }
        
        if(eventSource2.reminder) {
            event2Reminder.isHidden = false
            event2ReminderUnset.isHidden = true
        } else {
            event2Reminder.isHidden = true
            event2ReminderUnset.isHidden = false
        }
        
        event2.layer.backgroundColor = UIColor.white.cgColor
        event2.layer.shadowOffset = CGSize(width: 1, height: 2)
        event2.layer.shadowOpacity = 0.3
        event2.layer.shadowRadius = 5
        event2.layer.shadowColor = UIColor.black.cgColor
        event2.layer.masksToBounds = false
        
        event1.layer.cornerRadius = 10
        event1Title.text = eventSource1.title + " in"
        event1TimeUntil.text = "about " + eventSource1.timeUntil
        event1Time.text = eventSource1.time
        
        event2.layer.cornerRadius = 10
        event2Title.text = eventSource2.title + " in"
        event2TimeUntil.text = "about " + eventSource2.timeUntil
        event2Time.text = eventSource2.time
        
        collectionView.dataSource = data
        collectionView.reloadData()
        
        voiceUIFlows = data.getVoices()
        
        //Style ETA button
        sendETA.layer.cornerRadius = 20
        sendETA.layer.shadowColor = UIColor.black.cgColor
        sendETA.layer.shadowOffset = CGSize(width: 2, height: 2)
        sendETA.layer.shadowRadius = 5
        sendETA.layer.shadowOpacity = 0.5
        sendETA.layer.masksToBounds = false
        
        //Get permission to send push notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        UNUserNotificationCenter.current().delegate = self
    }
    
    @IBAction func event1ButtonClicked(_ sender: Any) {
        if !eventSource1.reminder {
            eventSource1.reminder = true
            event1Reminder.isHidden = false
            event1ReminderUnset.isHidden = true
        } else {
            eventSource1.reminder = false
            event1Reminder.isHidden = true
            event1ReminderUnset.isHidden = false
        }
    }
    
    @IBAction func unsetReminder1Clicked(_ sender: Any) {
        if !eventSource1.reminder {
            eventSource1.reminder = true
            event1Reminder.isHidden = false
            event1ReminderUnset.isHidden = true
        } else {
            eventSource1.reminder = false
            event1Reminder.isHidden = true
            event1ReminderUnset.isHidden = false
        }
    }
    @IBAction func event2ButtonClicked(_ sender: Any) {
        if !eventSource2.reminder {
            eventSource2.reminder = true
            event2Reminder.isHidden = false
            event2ReminderUnset.isHidden = true
        } else {
            eventSource2.reminder = false
            event2Reminder.isHidden = true
            event2ReminderUnset.isHidden = false
        }
    }
    
    @IBAction func unsetReminder2Clicked(_ sender: Any) {
        if !eventSource2.reminder {
            eventSource2.reminder = true
            event2Reminder.isHidden = false
            event2ReminderUnset.isHidden = true
        } else {
            eventSource2.reminder = false
            event2Reminder.isHidden = true
            event2ReminderUnset.isHidden = false
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //collectionView.deselectItem(at: indexPath, animated: true)
        
        let selectedChallenge = data.challengeAtIndexPath(indexPath)
        performSegue(withIdentifier: "selectChallenge", sender: selectedChallenge)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectChallenge" {
            if let selectedChallenge = sender as? Challenge, let destinationViewController = segue.destination as? ChallengeDetailedController {
                destinationViewController.selectedChallenge = selectedChallenge
                destinationViewController.createdChallenge = createdChallenge
            }
        }
        
        if segue.identifier == "popupEvent1" {
            if let destinationViewController = segue.destination as? PopUpController {
                destinationViewController.event = eventSource1
                let popupVC = segue.destination as! PopUpController
                popupVC.delegate = self
            }
        }
        
        if segue.identifier == "popupEvent2" {
            if let destinationViewController = segue.destination as? PopUpController {
                destinationViewController.event = eventSource2
                let popupVC = segue.destination as! PopUpController
                popupVC.delegate = self
            }
        }
        
        if segue.identifier == "toChallenge" {
            if let destinationViewController = segue.destination as? ChallengesController {
                destinationViewController.createdChallenge = createdChallenge
            }
        }
        
        if segue.identifier == "toVoiceUI"{
            if let destinationViewController = segue.destination as? VoiceUI {
                destinationViewController.UI = voiceUIFlows[0]
                destinationViewController.callback = { message in
                    if(message){
                        self.event2Reminder.isHidden = false
                        self.event2ReminderUnset.isHidden = true
                    }
                    self.eventSource2.reminder = message
                   
                }
            }
        }
    }
    
    @IBAction func hamburgerBtnTapped(_ sender: Any) {
        if !hamburgerMenuIsVisible {
            leadingC.constant = 150
            trailingC.constant = -150
            
            hamburgerMenuIsVisible = true
        } else {
            leadingC.constant = 0
            trailingC.constant = 0
            
            hamburgerMenuIsVisible = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func setReminder(event: Event) {
        print("inside home controller")
        if(event.objectID == 1) {
            eventSource1.reminder = event.reminder
            if eventSource1.reminder {
                event1Reminder.isHidden = false
                event1ReminderUnset.isHidden = true
            } else {
                event1Reminder.isHidden = true
                event1ReminderUnset.isHidden = false
            }
        }
        if(event.objectID == 2) {
            eventSource2.reminder = event.reminder
            if eventSource2.reminder {
                event2Reminder.isHidden = false
                event2ReminderUnset.isHidden = true
            } else {
                event2Reminder.isHidden = true
                event2ReminderUnset.isHidden = false
            }
        }
    }
    
    @IBAction func sendETA(_ sender: Any) {
        //Another way to do this is to just schedule
        //Define custom actions
        let option1 = UNNotificationAction(identifier: "send", title: "Send", options: UNNotificationActionOptions.destructive)
        let option2 = UNNotificationAction(identifier: "dictate", title: "Dictate", options: UNNotificationActionOptions.foreground)
        let option3 = UNNotificationAction(identifier: "cancel", title: "Cancel", options: UNNotificationActionOptions.destructive)
        
        //Add to new notification category
        let category = UNNotificationCategory(identifier: "lateNotification", actions: [option1, option2, option3], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "", options: [])
        
        //Add new category to Notification center
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Late:ly"
        notificationContent.subtitle = "You're Running Late!"
        notificationContent.body = "Would you like to send your ETA to Yassy and Bryce?"
        notificationContent.sound = UNNotificationSound.default
        notificationContent.categoryIdentifier = "lateNotification"
        notificationContent.badge = 1
        
        //Optional: add an image to your notification
        //        guard let imagePath = Bundle.main.path(forResource: "Apple", ofType: "png") else {return}
        //        let url = URL(fileURLWithPath: imagePath)
        //
        //        do {
        //            let attachment = try UNNotificationAttachment(identifier: "message", url: url, options: nil)
        //
        //        } catch{
        //            print("The attachment could not be loaded")
        //        }
        
        let notiTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // Two second delay
        let request = UNNotificationRequest(identifier: "timer done", content: notificationContent, trigger: notiTrigger)
        
        UNUserNotificationCenter.current().add(request){ (error:Error?) in
            if let error = error{
                print( "Error: \( error.localizedDescription)")
            }
        }
    }
    
    //this function makes it so that notification will fire even when app is running in the foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "send"{
            //TODO: Here, figure out how to send a "sent" confirmation
            
            print("send")
        } else if response.actionIdentifier == "dictate" {
            //TODO: Here, figure out how to navigate to a different UI controller.
            self.performSegue(withIdentifier: "toVoiceUI", sender: self);
            print("dictate")
        } else {
            print("cancel")
        }
        completionHandler()
    }
    
}



