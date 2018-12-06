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
    private var voices: [VoiceFlow] = []
    
    override init() {
        super.init()
        
        let currentDate = NSDate()
        
        voices = [VoiceFlow(objectID: 1, numFlows: 4, prompts: ["How can I help you?", "Here are your events for the day", "Reminder set for 10 minutes before. Would you like me to set a reminder for all social events?", "Reminders for all social events have been set."], suggestions: ["(Try asking \"what events do I have today\"?)", "(Try saying \"set a reminder for lunch with Sasha.\")", "(Try saying \"yes\")", "(Say \"go home\" to exit or click the \"X\" button)"], images: [UIImage(named: "TodaysEvents")!, UIImage(named: "SashaReminderSet")!], flowNeedsImage: [false, true, true, false]),
                  VoiceFlow(objectID: 2, numFlows: 6, prompts: ["How can I help you?", "What would you like to call your challenge?", "Challenge has been named \"Be on time to CS147\". Would you like to invite friends to this challenge?", "Sasha and Caroline have been invited to participate in this challenge. Would you like to set a reward?", "Default reward has been set.", "Challenge has been created!"], suggestions: ["Try saying \"create a new challenge.\"", "Try saying \"be on time to CS147 Section\"", "Try saying \"invite Caroline and Sasha.\"", "Try saying \"set default reward.\"", "Try saying \"finish creating challenge\"", "Try saying \"go home\" or click the \"X\""], images: [UIImage(named: "cake")!, UIImage(named: "challengeCreated")!],flowNeedsImage: [false, false, false, false, true, true]),
                  VoiceFlow(objectID: 3, numFlows: 3, prompts: ["What would you like to send to Yassy, Sasha and Caroline?","Your message says: \"I am getting on my bike right now.\" Ready to send it?", "Your message has been sent!"], suggestions: ["Try saying \"I am getting on my bike right now!\"", "Try saying \"yes.\"", "Try saying \"go home\" to exit of click the \"X\" button."], images: [UIImage(named: "notification")!], flowNeedsImage: [false, true, false])
        ]
        
        events = [Event(objectID: 1, title: "Meeting with CS 147 Group", time: "Today @ 11:15 AM", timeUntil: "1.5 hours", location: "@ Huang Basement", reminder: true, personPic: UIImage(named: "Sasha")!, locationPic: UIImage(named: "Huang")!),
                  Event(objectID: 2, title: "Lunch with Sasha", time: "Today @ 1:30 PM", timeUntil: "3 hours", location: "@ Coupa Green", reminder: false, personPic: UIImage(named: "Sasha")!, locationPic: UIImage(named: "CoupaGreen")!)
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
        
        // people: [Caroline, Sasha, Yass]
        
        challenges = [
            Challenge(title: "vs. Caroline", challengeDescription: "Be less late", createDate: createDate, endDate: endDate, winnerField: "is the least late 3 times", reward: UIImage(named: "cake"), people: [true, false, false]),
            Challenge(title: "vs. Dream Team", challengeDescription: "Show up on time", createDate: createDate, endDate: endDate, winnerField: "is on time for 5 lectures", reward: UIImage(named: "icecream"), people: [true, true, true]),
            Challenge(title: "vs. Sasha", challengeDescription: "Be first", createDate: createDate, endDate: endDate, winnerField: "gets there first 2 times", reward: UIImage(named: "gift"), people: [false, true, false]),
            Challenge(title: "vs. Yass", challengeDescription: "Don't be late", createDate: createDate, endDate: endDate, winnerField: "gets there first 2 times", reward: UIImage(named: "coffee"), people: [false, false, true])
        ]
    }
    
    func getVoices() -> [VoiceFlow] {
        return voices
    }
    
    func getEvent(index: Int) -> Event {
        return events[index]
    }
    
    func getChallenges() -> [Challenge] {
        return challenges
    }
    
    func addChallenge(challenge: Challenge) {
        challenges.append(challenge)
        challenges.reverse()
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
        cell.descriptionLabel.text = challenge.challengeDescription
        
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

