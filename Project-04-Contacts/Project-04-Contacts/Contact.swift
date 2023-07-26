//
//  Contact.swift
//  Project-04-Contacts
//
//  Created by Ilgın Akgöz on 22.07.2023.
//

import UIKit

struct Contact {
    let name: String
    let type: ContactType
    let gender: ContactGender
}

enum ContactType: CaseIterable {
    case allContacts
    case family
    case friend
    case work
    case danceClass
    case bookGroup
    
    var contactType: String {
        switch self {
        case .allContacts:
            return "All Contacts"
        case .family:
            return "Family"
        case .friend:
            return "Friends"
        case .work:
            return "Work"
        case .danceClass:
            return "Dance Class"
        case .bookGroup:
            return "Book Group"
        }
    }
}

enum ContactGender {
    case male
    case female
    
    var contactImage: UIImage {
        switch self {
        case .male:
            return UIImage(named: "male")!
        case .female:
            return UIImage(named: "female")!
        }
    }
}
