

import UIKit

class CreateChallengesController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var createChallenge: UIButton!
    
    @IBOutlet weak var cakeReward: UIButton!
    @IBOutlet weak var coffeeReward: UIButton!
    @IBOutlet weak var giftReward: UIButton!
    @IBOutlet weak var iceCreamReward: UIButton!
    
    var rewardImage:  UIImage!
    
    let datePicker = UIDatePicker()
    var challenge: Challenge!
    var data: Datasource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = Datasource()
        
        datePicker.datePickerMode = .date
        dateField.inputView = datePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        toolbar.setItems([doneButton], animated: true)
        
        dateField.inputAccessoryView = toolbar
        
        createChallenge.layer.cornerRadius = 20
        createChallenge.layer.shadowColor = UIColor.black.cgColor
        createChallenge.layer.shadowOffset = CGSize(width: 2, height: 2)
        createChallenge.layer.shadowRadius = 5
        createChallenge.layer.shadowOpacity = 0.5
        createChallenge.layer.masksToBounds = false
        
        cakeReward.layer.cornerRadius = 0.5 * cakeReward.bounds.size.width
        cakeReward.clipsToBounds = true
        cakeReward.layer.borderWidth = 2
        cakeReward.layer.borderColor = UIColor.black.cgColor
        cakeReward.layer.shadowColor = UIColor.black.cgColor
        cakeReward.layer.shadowOffset = CGSize(width: 2, height: 2)
        cakeReward.layer.shadowRadius = 5
        cakeReward.layer.shadowOpacity = 0.5
        cakeReward.layer.masksToBounds = false
        
        coffeeReward.layer.cornerRadius = 0.5 * cakeReward.bounds.size.width
        coffeeReward.layer.borderWidth = 2
        coffeeReward.layer.borderColor = UIColor.black.cgColor
        coffeeReward.layer.shadowColor = UIColor.black.cgColor
        coffeeReward.layer.shadowOffset = CGSize(width: 2, height: 2)
        coffeeReward.layer.shadowRadius = 5
        coffeeReward.layer.shadowOpacity = 0.5
        coffeeReward.layer.masksToBounds = false
        
        giftReward.layer.cornerRadius = 0.5 * cakeReward.bounds.size.width
        giftReward.layer.borderWidth = 2
        giftReward.layer.borderColor = UIColor.black.cgColor
        giftReward.layer.shadowColor = UIColor.black.cgColor
        giftReward.layer.shadowOffset = CGSize(width: 2, height: 2)
        giftReward.layer.shadowRadius = 5
        giftReward.layer.shadowOpacity = 0.5
        giftReward.layer.masksToBounds = false
        
        iceCreamReward.layer.cornerRadius = 0.5 * cakeReward.bounds.size.width
        iceCreamReward.layer.borderWidth = 2
        iceCreamReward.layer.borderColor = UIColor.black.cgColor
        iceCreamReward.layer.shadowColor = UIColor.black.cgColor
        iceCreamReward.layer.shadowOffset = CGSize(width: 2, height: 2)
        iceCreamReward.layer.shadowRadius = 5
        iceCreamReward.layer.shadowOpacity = 0.5
        iceCreamReward.layer.masksToBounds = false
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
    
    @IBAction func createClicked(_ sender: Any) {
        let currentDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let createDate = dateFormatter.string(from: currentDate as Date)
        
        challenge = Challenge(title: titleField.text, challengeDescription: descriptionField.text, createDate: createDate, endDate: dateField.text, reward: rewardImage)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createdChallenge" {
            if let destinationViewController = segue.destination as? ChallengesController {
                destinationViewController.createdChallenge = challenge
            }
        }
    }
        
    @objc func doneClicked() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
    
        dateField.text = dateFormatter.string(from: datePicker.date)
        datePicker.endEditing(true)
        dateField.endEditing(true)
        datePicker.isHidden = true
    }
}



