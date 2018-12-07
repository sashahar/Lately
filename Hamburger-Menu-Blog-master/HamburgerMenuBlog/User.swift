import UIKit

class User: NSObject {
    
    var name: String!
    var profilePic: UIImage!
    var location: String!
    var streak: NSDecimalNumber!
    var friends: [User] = []
    
    init(name: String!, profilePic: UIImage!, location: String!, streak: NSDecimalNumber!) {
        self.name = name
        self.profilePic = profilePic
        self.location = location
        self.streak = streak
    }
    
    func addFriends(friends: [User] = []) {
        self.friends.append(contentsOf: friends)
    }
    
    func addFriend(friend: User) {
        self.friends.append(friend)
    }
}

