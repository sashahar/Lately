//
//  Datasource.swift
//  HamburgerMenuBlog
//
//  Created by Bryce Johnson on 11/26/18.
//  Copyright © 2018 Erica Millado. All rights reserved.
//

import UIKit

class Datasource: NSObject, UICollectionViewDataSource {
    
    private var users: [User] = []
    private var challenges: [Challenge] = []
    private var events: [Event] = []
    
    override init() {
        super.init()
        
        users = [User(name: "Bryce", profilePic: UIImage(named: "Bryce"), location: "Frisco, TX", streak: 5.0),
                 User(name: "Sasha", profilePic: UIImage(named: "Sasha"), location: "Palo Alto, CA", streak: 2.0),
        ]
        
        users[0].addFriend(friend: users[1])
        users[1].addFriend(friend: users[0])
        
        let currentDate = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        let eventTime = timeFormatter.string(from: currentDate as Date)
        
        events = [Event(title: "CS 147", eventDescription: "Meeting", time: eventTime, location: "Hewelett 201", people: users),
                  Event(title: "Lunch", eventDescription: "with Sasha", time: eventTime, location: "Coupa Green", people: users)
        ]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let createDate = dateFormatter.string(from: currentDate as Date)
        
        var dateComponents = DateComponents()
        dateComponents.year = 2018
        dateComponents.month = 11
        dateComponents.day = 30
        
        let userCalendar = Calendar.current // user calendar
        let d = userCalendar.date(from: dateComponents)
        let endDate = dateFormatter.string(from: d!)
        
        challenges = [
            Challenge(title: "Cake", challengeDescription: "First", createDate: createDate, endDate: endDate, reward: UIImage(named: "cake")!),
            Challenge(title: "Ice Cream", challengeDescription: "Second", createDate: createDate, endDate: endDate, reward: UIImage(named: "icecream")!),
            Challenge(title: "Gift", challengeDescription: "First", createDate: createDate, endDate: endDate, reward: UIImage(named: "gift")!),
            Challenge(title: "Coffee", challengeDescription: "Second", createDate: createDate, endDate: endDate, reward: UIImage(named: "coffee")!),
        ]
        
        challenges.sort(by: { $0.endDate > $1.createDate })
    }
    
    func challengeAtIndexPath(_ indexPath: IndexPath) -> Challenge {
        return challenges[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return challenges.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        
        let challenge = challenges[indexPath.item]
        if let myImage = challenge.reward {
            
            cell.imageView.image = myImage
        }
        
        cell.titleLabel.text = challenge.title
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width:3,height: 3)
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        return cell
    }
    
}

