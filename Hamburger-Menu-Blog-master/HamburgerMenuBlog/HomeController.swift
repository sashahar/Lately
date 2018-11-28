
import UIKit

class HomeController: UIViewController {
    
    @IBOutlet var leadingC: NSLayoutConstraint!
    @IBOutlet var trailingC: NSLayoutConstraint!
    @IBOutlet var ubeView: UIView!
    
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userLocation: UILabel!
    
    @IBOutlet weak var event1: UIView!
    @IBOutlet weak var event2: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var hamburgerMenuIsVisible = false
    var dataSource: Datasource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        header.layer.shadowOffset = CGSize(width: 0, height: 5)
        header.layer.shadowOpacity = 0.5
        header.layer.shadowRadius = 10
        header.layer.shadowColor = UIColor.black.cgColor
        header.layer.masksToBounds = false
        
        profilePic.layer.cornerRadius = 45
        profilePic.layer.masksToBounds = true

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "AppIcon")
        imageView.image = image
        navigationItem.titleView = imageView
        
        event1.layer.cornerRadius = 10
        event1.layer.masksToBounds = true
        event2.layer.cornerRadius = 10
        event2.layer.masksToBounds = true
        
        dataSource = Datasource()
        
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let selectedChallenge = dataSource.challengeAtIndexPath(indexPath)
        
        performSegue(withIdentifier: "selectChallenge", sender: selectedChallenge)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectChallenge" {
            if let selectedChallenge = sender as? Challenge, let destinationViewController = segue.destination as? ChallengeDetailedController {
                destinationViewController.selectedChallenge = selectedChallenge
                print(selectedChallenge)
            }
        }
    }
    
    
    @IBAction func hamburgerBtnTapped(_ sender: Any) {
        //if the hamburger menu is NOT visible, then move the ubeView back to where it used to be
        if !hamburgerMenuIsVisible {
            leadingC.constant = 150
            //this constant is NEGATIVE because we are moving it 150 points OUTWARD and that means -150
            trailingC.constant = -150
            
            //1
            hamburgerMenuIsVisible = true
        } else {
            //if the hamburger menu IS visible, then move the ubeView back to its original position
            leadingC.constant = 0
            trailingC.constant = 0
            
            //2
            hamburgerMenuIsVisible = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
    }
}



