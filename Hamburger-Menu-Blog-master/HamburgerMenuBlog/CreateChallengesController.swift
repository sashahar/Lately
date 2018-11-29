

import UIKit

class CreateChallengesController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var createChallenge: UIButton!
    
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



