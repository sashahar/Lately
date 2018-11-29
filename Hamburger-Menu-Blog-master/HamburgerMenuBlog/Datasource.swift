//
//  Datasource.swift
//  HamburgerMenuBlog
//
//  Created by Bryce Johnson on 11/26/18.
//  Copyright © 2018 Erica Millado. All rights reserved.
//

import UIKit

class Datasource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var challenges: [Challenge] = []
    private var events: [Event] = []
    
    override init() {
        super.init()
        
        let currentDate = NSDate()
        
        events = [Event(objectID: 1, title: "Meeting with CS 147 Group", time: "Today @ 11:15 AM", timeUntil: "1.5 hours", location: "@ Huang Basement", reminder: true, personPic: UIImage(named: "Sasha")!),
                  Event(objectID: 2, title: "Lunch with Sasha", time: "Today @ 1:30 PM", timeUntil: "3 hours", location: "@ Coupa Green", reminder: false, personPic: UIImage(named: "Sasha")!)
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
            Challenge(title: "Coffee", challengeDescription: "Second", createDate: createDate, endDate: endDate, reward: UIImage(named: "coffee")!)
        ]
        
        challenges.sort(by: { $0.endDate > $1.createDate })
    }
    
    func getEvent(index: Int) -> Event {
        return events[index]
    }
    
    func getChallenges() -> [Challenge] {
        return challenges
    }
    
    func addChallenge(challenge: Challenge) {
        challenges.append(challenge)
    }
    
    func challengeAtIndexPath(_ indexPath: IndexPath) -> Challenge {
        return challenges[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return challenges.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
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
        cell.layer.shadowOffset = CGSize(width:1,height: 2)
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 0.4
        cell.layer.masksToBounds = false
        return cell
    }
    
}

