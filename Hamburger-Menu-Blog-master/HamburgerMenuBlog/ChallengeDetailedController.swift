//
//  DetailViewController.swift
//  GridLayout
//
//  Created by Sztanyi Szabolcs on 2017. 04. 05..
//  Copyright © 2017. Sabminder. All rights reserved.
//

import UIKit

class ChallengeDetailedController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionField: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var rewardImage: UIImageView!
    @IBOutlet weak var header: UIView!
    
    @IBOutlet weak var carolinePic: UIImageView!
    @IBOutlet weak var sashaPic: UIImageView!
    @IBOutlet weak var yassPic: UIImageView!
    
    var selectedChallenge: Challenge!
    var createdChallenge: Challenge!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionField.lineBreakMode = .byWordWrapping
        descriptionField.numberOfLines = 0
        
        titleLabel.text = selectedChallenge.title
        descriptionField.text = selectedChallenge.challengeDescription
        rewardImage.image = selectedChallenge.reward
        
        endDateLabel.text = "Challenge Ends: " + selectedChallenge.endDate
        
        header.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        header.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        header.layer.shadowOpacity = 1.0
        header.layer.shadowRadius = 5
        header.layer.masksToBounds = false
        
        carolinePic.layer.cornerRadius = carolinePic.bounds.size.width / 2
        carolinePic.layer.masksToBounds = true
        carolinePic.layer.borderColor = UIColor.black.cgColor
        
        sashaPic.layer.cornerRadius = sashaPic.bounds.size.width / 2
        sashaPic.layer.masksToBounds = true
        sashaPic.layer.borderColor = UIColor.black.cgColor
        
        yassPic.layer.cornerRadius = yassPic.bounds.size.width / 2
        yassPic.layer.masksToBounds = true
        yassPic.layer.borderColor = UIColor.black.cgColor
        
        // people: [Caroline, Sasha, Yass]
        if selectedChallenge.people[0] == false {
            carolinePic.isHidden = true
        }
        
        if selectedChallenge.people[1] == false {
            sashaPic.isHidden = true
        }
        
        if selectedChallenge.people[2] == false {
            yassPic.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destinationViewController = segue.destination as? HomeController {
                destinationViewController.createdChallenge = createdChallenge
            }
    }
}

