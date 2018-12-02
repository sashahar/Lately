//
//  VoiceFlow.swift
//  HamburgerMenuBlog
//
//  Created by Caroline Braviak on 12/1/18.
//  Copyright © 2018 Erica Millado. All rights reserved.
//

import UIKit

class VoiceFlow: NSObject {
    
    var objectID: Int!
    var numFlows: Int!
    var suggestions: [String] = []
    var prompts: [String] = []
    var images: [UIImage] = []
    var flowNeedsImage: [Bool] = []
    
    init(objectID: Int!, numFlows: Int!, prompts: [String] = [], suggestions: [String] = [], images: [UIImage] = [], flowNeedsImage: [Bool] = []){
        self.objectID = objectID
        self.numFlows = numFlows
        self.prompts = prompts
        self.suggestions = suggestions
        self.images = images
        self.flowNeedsImage = flowNeedsImage
    }
}
