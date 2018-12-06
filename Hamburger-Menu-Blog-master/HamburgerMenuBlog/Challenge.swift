//
//  Challenge.swift
//  HamburgerMenuBlog
//
//  Created by Bryce Johnson on 11/26/18.
//  Copyright © 2018 Erica Millado. All rights reserved.
//

import UIKit

class Challenge: NSObject {
    
    var title: String!
    var challengeDescription: String!
    var createDate: String!
    var endDate: String!
    var winnerField: String!
    var reward: UIImage!
    var people: [Bool] = []
    
    // people: [Caroline, Sasha, Yass]
    
    init(title: String!, challengeDescription: String!, createDate: String!, endDate: String!, winnerField: String!, reward: UIImage!, people: [Bool] = []) {
        self.title = title
        self.challengeDescription = challengeDescription
        self.createDate = createDate
        self.endDate = endDate
        self.winnerField = winnerField
        self.reward = reward
        self.people = people
    }
}

