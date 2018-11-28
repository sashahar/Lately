

import UIKit

class CreateChallengesController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var createChallenge: UIButton!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .date
        dateField.inputView = datePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        toolbar.setItems([doneButton], animated: true)
        
        dateField.inputAccessoryView = toolbar
    }
    
    @IBAction func createClicked(_ sender: Any) {
        
    }
    
    @objc func doneClicked() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        dateField.text = dateFormatter.string(from: datePicker.date)
        //self.view.endEditing(true)  -- Breaks
        self.datePicker.endEditing(true)
    }
}



