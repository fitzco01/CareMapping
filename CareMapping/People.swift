//
//  People.swift
//  CareMapping
//
//  Created by Connor Fitzpatrick on 5/21/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation
import UIKit

class People {
    var firstName: String
    var lastName: String
    var position: String
    var phoneNumber: String
    var email: String
    var website: String
    var notes: String
    var picture: UIImage?
    
    
    
    init(firstName: String, lastName: String, position: String, phoneNumber: String, email: String, website: String, notes: String, picture: UIImage?) {
        self.firstName = firstName
        self.lastName = lastName
        self.position = position
        self.phoneNumber = phoneNumber
        self.email = email
        self.website = website
        self.notes = notes
        self.picture = picture
    }
    
    func getFirstName() -> String {
        return self.firstName
    }
    
    func getLastName() -> String {
        return self.lastName
    }
    
    func getFullName() -> String {
        return self.firstName + " " + self.lastName
    }
    
    func getposition() -> String {
        return self.position
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