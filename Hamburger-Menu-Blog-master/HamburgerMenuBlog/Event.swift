//
//  Challenge.swift
//  HamburgerMenuBlog
//
//  Created by Bryce Johnson on 11/26/18.
//  Copyright © 2018 Erica Millado. All rights reserved.
//

import UIKit

class Event: NSObject {
    
    var title: String!
    var eventDescription: String!
    var time: String!
    var timeUntil: NSNumber!
    var location: String!
    var people: [User] = []
    
    init(title: String!, eventDescription: String!, time: String?, location: String!, people: [User] = []) {
        self.title = title
        self.eventDescription = eventDescription
        self.time = time
        self.location = location
        self.people = people
    }
    
    func addPeople(people: [User] = []) {
        self.people.append(contentsOf: people)
    }
    
    func addPerson(person: User) {
        self.people.append(person)
    }
    
    func getTimeUntil() -> String {
        
        return ""
    }
}

