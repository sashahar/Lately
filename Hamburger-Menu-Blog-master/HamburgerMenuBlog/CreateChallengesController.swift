

import UIKit

@available(iOS 11.0, *)
class CreateChallengesController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var winnerField: UITextField!
    
    @IBOutlet weak var createChallenge: UIButton!
    
    @IBOutlet weak var cakeReward: UIButton!
    @IBOutlet weak var coffeeReward: UIButton!
    @IBOutlet weak var giftReward: UIButton!
    @IBOutlet weak var iceCreamReward: UIButton!
    
    @IBOutlet weak var carolinePic: UIImageView!
    @IBOutlet weak var sashaPic: UIImageView!
    @IBOutlet weak var yassPic: UIImageView!
    
    @IBOutlet weak var carolineButton: UIButton!
    @IBOutlet weak var sashaButton: UIButton!
    @IBOutlet weak var yassButton: UIButton!
    @IBOutlet var mainView: UIView!
    
    var rewardImage:  UIImage!
    
    var datePicker: UIDatePicker!
    var challenge: Challenge!
    var data: Datasource!
    var people: [Bool] = []
    // people: [Caroline, Sasha, Yass]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = Datasource()
        
        people = [false, false, false]

        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(CreateChallengesController.dateChanged(datePicker:)), for: .valueChanged)
        
        dateField.inputView = datePicker
        
        createChallenge.layer.cornerRadius = 20
        createChallenge.layer.shadowColor = UIColor.black.cgColor
        createChallenge.layer.shadowOffset = CGSize(width: 2, height: 2)
        createChallenge.layer.shadowRadius = 5
        createChallenge.layer.shadowOpacity = 0.5
        createChallenge.layer.masksToBounds = false
        
        cakeReward.layer.cornerRadius = 0.5 * cakeReward.bounds.size.width
        cakeReward.clipsToBounds = true
        cakeReward.layer.borderWidth = 4
        cakeReward.layer.borderColor = UIColor.black.cgColor
        cakeReward.layer.shadowColor = UIColor.black.cgColor
        cakeReward.layer.shadowOffset = CGSize(width: 2, height: 2)
        cakeReward.layer.shadowRadius = 5
        cakeReward.layer.shadowOpacity = 0.5
        cakeReward.layer.masksToBounds = false
        
        coffeeReward.layer.cornerRadius = 0.5 * cakeReward.bounds.size.width
        coffeeReward.layer.borderWidth = 4
        coffeeReward.layer.borderColor = UIColor.black.cgColor
        coffeeReward.layer.shadowColor = UIColor.black.cgColor
        coffeeReward.layer.shadowOffset = CGSize(width: 2, height: 2)
        coffeeReward.layer.shadowRadius = 5
        coffeeReward.layer.shadowOpacity = 0.5
        coffeeReward.layer.masksToBounds = false
        
        giftReward.layer.cornerRadius = 0.5 * cakeReward.bounds.size.width
        giftReward.layer.borderWidth = 4
        giftReward.layer.borderColor = UIColor.black.cgColor
        giftReward.layer.shadowColor = UIColor.black.cgColor
        giftReward.layer.shadowOffset = CGSize(width: 2, height: 2)
        giftReward.layer.shadowRadius = 5
        giftReward.layer.shadowOpacity = 0.5
        giftReward.layer.masksToBounds = false
        
        iceCreamReward.layer.cornerRadius = 0.5 * cakeReward.bounds.size.width
        iceCreamReward.layer.borderWidth = 4
        iceCreamReward.layer.borderColor = UIColor.black.cgColor
        iceCreamReward.layer.shadowColor = UIColor.black.cgColor
        iceCreamReward.layer.shadowOffset = CGSize(width: 2, height: 2)
        iceCreamReward.layer.shadowRadius = 5
        iceCreamReward.layer.shadowOpacity = 0.5
        iceCreamReward.layer.masksToBounds = false
        
        carolinePic.layer.cornerRadius = carolinePic.bounds.size.width / 2
        carolinePic.layer.masksToBounds = true
        carolinePic.layer.borderColor = UIColor.black.cgColor
        
        sashaPic.layer.cornerRadius = sashaPic.bounds.size.width / 2
        sashaPic.layer.masksToBounds = true
        sashaPic.layer.borderColor = UIColor.black.cgColor
        
        yassPic.layer.cornerRadius = yassPic.bounds.size.width / 2
        yassPic.layer.masksToBounds = true
        yassPic.layer.borderColor = UIColor.black.cgColor
        
        carolineButton.layer.cornerRadius = 0.5 * carolineButton.bounds.size.width
        carolineButton.clipsToBounds = true
        carolineButton.layer.borderWidth = 4
        carolineButton.layer.borderColor = UIColor.black.cgColor
        carolineButton.layer.shadowColor = UIColor.black.cgColor
        carolineButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        carolineButton.layer.shadowRadius = 5
        carolineButton.layer.shadowOpacity = 0.5
        carolineButton.layer.masksToBounds = false
        
        sashaButton.layer.cornerRadius = 0.5 * sashaButton.bounds.size.width
        sashaButton.clipsToBounds = true
        sashaButton.layer.borderWidth = 4
        sashaButton.layer.borderColor = UIColor.black.cgColor
        sashaButton.layer.shadowColor = UIColor.black.cgColor
        sashaButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        sashaButton.layer.shadowRadius = 5
        sashaButton.layer.shadowOpacity = 0.5
        sashaButton.layer.masksToBounds = false
        
        yassButton.layer.cornerRadius = 0.5 * yassButton.bounds.size.width
        yassButton.clipsToBounds = true
        yassButton.layer.borderWidth = 4
        yassButton.layer.borderColor = UIColor.black.cgColor
        yassButton.layer.shadowColor = UIColor.black.cgColor
        yassButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        yassButton.layer.shadowRadius = 5
        yassButton.layer.shadowOpacity = 0.5
        yassButton.layer.masksToBounds = false
    }
    
    @IBAction func cakeClicked(_ sender: Any) {
        rewardImage = UIImage(named: "cake")!
        coffeeReward.layer.borderColor = UIColor.black.cgColor
        giftReward.layer.borderColor = UIColor.black.cgColor
        iceCreamReward.layer.borderColor = UIColor.black.cgColor
        cakeReward.layer.borderColor = UIColor.red.cgColor
    }
    
    @IBAction func coffeeClicked(_ sender: Any) {
        rewardImage = UIImage(named: "coffee")!
        cakeReward.layer.borderColor = UIColor.black.cgColor
        giftReward.layer.borderColor = UIColor.black.cgColor
        iceCreamReward.layer.borderColor = UIColor.black.cgColor
        coffeeReward.layer.borderColor = UIColor.red.cgColor
    }
    
    @IBAction func giftClicked(_ sender: Any) {
        rewardImage = UIImage(named: "gift")!
        cakeReward.layer.borderColor = UIColor.black.cgColor
        coffeeReward.layer.borderColor = UIColor.black.cgColor
        iceCreamReward.layer.borderColor = UIColor.black.cgColor
        giftReward.layer.borderColor = UIColor.red.cgColor
    }
    
    @IBAction func icecreamClicked(_ sender: Any) {
        rewardImage = UIImage(named: "icecream")!
        cakeReward.layer.borderColor = UIColor.black.cgColor
        coffeeReward.layer.borderColor = UIColor.black.cgColor
        giftReward.layer.borderColor = UIColor.black.cgColor
        iceCreamReward.layer.borderColor = UIColor.red.cgColor
    }
    
    @IBAction func viewTapped(_ sender: Any) {
        datePicker.endEditing(true)
        dateField.endEditing(true)
        titleField.endEditing(true)
        descriptionField.endEditing(true)
        winnerField.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        dateField.text = dateFormatter.string(from: datePicker.date)
        datePicker.endEditing(true)
    }
    
    // people: [Caroline, Sasha, Bryce]
    @IBAction func carolineClicked(_ sender: Any) {
        if people[0] {
            carolineButton.layer.borderColor = UIColor.black.cgColor
            people[0] = false
        } else {
            carolineButton.layer.borderColor = UIColor.red.cgColor
            people[0] = true
        }
    }
    
    @IBAction func sashaClicked(_ sender: Any) {
        if people[1] {
            sashaButton.layer.borderColor = UIColor.black.cgColor
            people[1] = false
        } else {
            sashaButton.layer.borderColor = UIColor.red.cgColor
            people[1] = true
        }
    }
    
    @IBAction func yasmeenClicked(_ sender: Any) {
        if people[2] {
            yassButton.layer.borderColor = UIColor.black.cgColor
            people[2] = false
        } else {
            yassButton.layer.borderColor = UIColor.red.cgColor
            people[2] = true
        }
    }
    
    @IBAction func createClicked(_ sender: Any) {
        let currentDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let createDate = dateFormatter.string(from: currentDate as Date)
        print(people)
        challenge = Challenge(title: titleField.text, challengeDescription: descriptionField.text, createDate: createDate, endDate: dateField.text, winnerField: winnerField.text, reward: rewardImage, people: people, notification: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createdChallenge" {
            if let destinationViewController = segue.destination as? ChallengesController {
                destinationViewController.createdChallenge = challenge
            }
        }
    }
        

    
}



