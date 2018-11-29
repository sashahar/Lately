
import UIKit

class HomeController: UIViewController, UICollectionViewDelegate, popupControllerDelegate {
    
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
    
    @IBOutlet weak var event2: UIView!
    @IBOutlet weak var event2Title: UILabel!
    @IBOutlet weak var event2TimeUntil: UILabel!
    @IBOutlet weak var event2Time: UILabel!
    @IBOutlet weak var event2Reminder: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var hamburgerMenuIsVisible = false
    var data: Datasource!
    var eventSource1: Event!
    var eventSource2: Event!
    var createdChallenge: Challenge!
    
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
        
        header.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        header.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        header.layer.shadowOpacity = 1.0
        header.layer.shadowRadius = 0.0
        header.layer.masksToBounds = false
        
        profilePic.layer.cornerRadius = 45
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
        
        event1.layer.shadowOffset = .zero
        event1.layer.shadowOpacity = 0.4
        event1.layer.shadowRadius = 5
        event1.layer.shadowColor = UIColor.black.cgColor
        //event1.layer.masksToBounds = false
        
        eventSource1 = data.getEvent(index: 0)
        eventSource2 = data.getEvent(index: 1)
        
        if(eventSource1.reminder) {
            event1Reminder.isHidden = false
        } else {
            event1Reminder.isHidden = true
        }
        
        if(eventSource2.reminder) {
            event2Reminder.isHidden = false
        } else {
            event2Reminder.isHidden = true
        }
        
        event2.layer.shadowOffset = CGSize(width: 1, height: 2)
        event2.layer.shadowOpacity = 0.4
        event2.layer.shadowRadius = 5
        event2.layer.shadowColor = UIColor.black.cgColor
        event2.layer.masksToBounds = false
        
        event1.layer.cornerRadius = 10
        event1.layer.masksToBounds = true
        event1Title.text = eventSource1.title + " in"
        event1TimeUntil.text = "about " + eventSource1.timeUntil
        event1Time.text = eventSource1.time
        
        event2.layer.cornerRadius = 10
        event2.layer.masksToBounds = true
        event2Title.text = eventSource2.title + " in"
        event2TimeUntil.text = "about " + eventSource2.timeUntil
        event2Time.text = eventSource2.time
        
        collectionView.dataSource = data
        collectionView.reloadData()
    }
    
    @IBAction func event1ButtonClicked(_ sender: Any) {
        if !eventSource1.reminder {
            eventSource1.reminder = true
            event1Reminder.isHidden = false
        } else {
            eventSource1.reminder = false
            event1Reminder.isHidden = true
        }
    }
    
    @IBAction func event2ButtonClicked(_ sender: Any) {
        if !eventSource2.reminder {
            eventSource2.reminder = true
        } else {
            eventSource2.reminder = false
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
                print(selectedChallenge)
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
            } else {
                event1Reminder.isHidden = true
            }
        }
        if(event.objectID == 2) {
            eventSource2.reminder = event.reminder
            if eventSource2.reminder {
               event2Reminder.isHidden = false
            } else {
                event2Reminder.isHidden = true
            }
        }
    }
}



