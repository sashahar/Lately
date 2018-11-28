//
//  Challenge.swift
//  HamburgerMenuBlog
//
//  Created by Bryce Johnson on 11/26/18.
//  Copyright © 2018 Erica Millado. All rights reserved.
//

import UIKit

class Challenge: NSObject {
    
    var objectID: String!
    var title: String!
    var challengeDescription: String!
    var reward: UIImage!
    
    init(objectID: String!, title: String!, challengeDescription: String!, reward: UIImage!) {
        self.objectID = objectID
        self.title = title
        self.challengeDescription = challengeDescription
        self.reward = reward
    }
    
}

