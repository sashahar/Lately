//
//  Challenge.swift
//  HamburgerMenuBlog
//
//  Created by Bryce Johnson on 11/26/18.
//  Copyright © 2018 Erica Millado. All rights reserved.
//

import UIKit

class Event: NSObject {
    
    var objectID: Int!
    var title: String!
    var time: String!
    var timeUntil: String!
    var location: String!
    var reminder: Bool!
    var personPic: UIImage!
    var locationPic: UIImage!
    
    init(objectID: Int!, title: String!, time: String?, timeUntil: String!, location: String!, reminder: Bool!, personPic: UIImage, locationPic: UIImage) {
        self.objectID = objectID
        self.title = title
        self.time  = time
        self.timeUntil = timeUntil
        self.location = location
        self.reminder = reminder
        self.personPic = personPic
        self.locationPic = locationPic
    }
    
    func setReminder() {
        reminder = true
    }
}

