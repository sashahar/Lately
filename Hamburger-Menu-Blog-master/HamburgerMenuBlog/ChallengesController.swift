
import UIKit

@available(iOS 11.0, *)
class ChallengesController: UIViewController {
    
    @IBOutlet var leadingC: NSLayoutConstraint!
    @IBOutlet var trailingC: NSLayoutConstraint!
    @IBOutlet var ubeView: UIView!
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var carolinePic: UIImageView!
    @IBOutlet weak var sashaPic: UIImageView!
    @IBOutlet weak var yassPic: UIImageView!
    
    @IBOutlet weak var header: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var voiceButton: UIBarButtonItem!
    
    var hamburgerMenuIsVisible = false
    var data: Datasource!
    var createdChallenge: Challenge!
    var voiceFlows: [VoiceFlow]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if data == nil {
            data = Datasource()
        }
        
        voiceFlows = data.getVoices()
        
        if createdChallenge != nil {
            data.addChallenge(challenge: createdChallenge)
        }
        
        carolinePic.layer.cornerRadius = carolinePic.frame.size.width / 2
        carolinePic.layer.masksToBounds = true
        carolinePic.layer.borderWidth = 1
        carolinePic.layer.borderColor = UIColor.black.cgColor
        
        sashaPic.layer.cornerRadius = sashaPic.frame.size.width / 2
        sashaPic.layer.masksToBounds = true
        sashaPic.layer.borderWidth = 1
        sashaPic.layer.borderColor = UIColor.black.cgColor
        
        yassPic.layer.cornerRadius = yassPic.frame.size.width / 2
        yassPic.layer.masksToBounds = true
        yassPic.layer.borderWidth = 1
        yassPic.layer.borderColor = UIColor.black.cgColor
        
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
        
        createButton.layer.cornerRadius = 20
        createButton.layer.shadowColor = UIColor.black.cgColor
        createButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        createButton.layer.shadowRadius = 5
        createButton.layer.shadowOpacity = 0.5
        createButton.layer.masksToBounds = false
        
        collectionView.dataSource = data
        collectionView.reloadData()
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
            }
        }
        
        if segue.identifier == "goHome" {
            if let destinationViewController = segue.destination as? HomeController {
                destinationViewController.createdChallenge = createdChallenge
            }
        }
        
        if segue.identifier == "createChallengeWithVoice" {
            if let destinationViewController = segue.destination as? VoiceUI{
                destinationViewController.UI = voiceFlows[1]
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



