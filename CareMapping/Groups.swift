//
//  Groups.swift
//  CareMapping
//
//  Created by Connor Fitzpatrick on 5/21/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation
import UIKit

class Groups {
    var groupName: String
    var numberOfPeople: String
    var phoneNumber: String
    var email: String
    var website: String
    var notes: String
    var picture: UIImage?
    
    init(groupName: String, numberOfPeople: String, phoneNumber: String, email: String, website: String, notes: String, picture: UIImage?) {
        self.groupName = groupName
        self.numberOfPeople = numberOfPeople
        self.phoneNumber = phoneNumber
        self.email = email
        self.website = website
        self.notes = notes
        self.picture = picture
    }
    
    func getGroupName() -> String {
        return self.groupName
    }
    
    func getNumberOfPeople() -> String {
        return self.numberOfPeople
    }
    
    func getPhoneNumber() -> String {
        return self.phoneNumber
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    func getWebsite() -> String {
        return self.website
    }
    
    func getNotes() -> String {
        return self.notes
    }
    
    func getPicture() -> UIImage? {
        return self.picture
    }
}