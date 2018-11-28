//
//  Datasource.swift
//  HamburgerMenuBlog
//
//  Created by Bryce Johnson on 11/26/18.
//  Copyright © 2018 Erica Millado. All rights reserved.
//

import UIKit

class Datasource: NSObject, UICollectionViewDataSource {
    
    private var challenges: [Challenge] = []
    
    override init() {
        super.init()
        
        challenges = [
            Challenge(objectID: "1", title: "Cake", challengeDescription: "First", reward: UIImage(named: "cake")!),
            Challenge(objectID: "2", title: "Ice Cream", challengeDescription: "Second", reward: UIImage(named: "icecream")!),
            Challenge(objectID: "1", title: "Gift", challengeDescription: "First", reward: UIImage(named: "gift")!),
            Challenge(objectID: "2", title: "Coffee", challengeDescription: "Second", reward: UIImage(named: "coffee")!),
        ]
        
        //challenges.sort(by: { $0.title < $1.name })
    }
    
    func challengeAtIndexPath(_ indexPath: IndexPath) -> Challenge {
        return challenges[indexPath.item]
    }
    
    // MARK: collectionView methods
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

