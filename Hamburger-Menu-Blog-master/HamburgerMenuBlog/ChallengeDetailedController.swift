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
    @IBOutlet weak var rewardImage: UIImageView!
    
//    var title: String!
//    var challengeDescription: String!
//    var createDate: String!
//    var endDate: String!
//    var daysLeft: NSNumber?
//    var reward: UIImage!
    
    var selectedChallenge: Challenge!
    
    // MARK: view methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        descriptionField.lineBreakMode = .byWordWrapping
        descriptionField.numberOfLines = 0
        
        titleLabel.text = selectedChallenge.title
        descriptionField.text = selectedChallenge.challengeDescription
        rewardImage.image = selectedChallenge.reward
        
    }
    
}

