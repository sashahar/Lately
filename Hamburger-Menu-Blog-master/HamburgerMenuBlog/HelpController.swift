import UIKit

@available(iOS 11.0, *)

class HelpController: UIViewController {
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet var ubeView: UIView!
    
    @IBOutlet weak var header: UIView!
    var hamburgerMenuIsVisible = false
    var createdChallenge: Challenge!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    }
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toChallenge" {
        if let destinationViewController = segue.destination as? ChallengesController {
            destinationViewController.createdChallenge = createdChallenge
        }
    }
    
    if segue.identifier == "toHome" {
        if let destinationViewController = segue.destination as? HomeController {
            destinationViewController.createdChallenge = createdChallenge
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
}
