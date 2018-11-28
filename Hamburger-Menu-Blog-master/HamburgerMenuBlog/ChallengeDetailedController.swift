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
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var rewardImage: UIImageView!
    
    var selectedChallenge: Challenge!
    
    // MARK: view methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedChallenge.title
        descriptionField.text = selectedChallenge.challengeDescription
        rewardImage.image = selectedChallenge.reward
        
    }
    
}

