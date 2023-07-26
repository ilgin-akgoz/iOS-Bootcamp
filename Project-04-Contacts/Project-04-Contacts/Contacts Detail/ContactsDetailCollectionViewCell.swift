//
//  ContactsDetailCollectionViewCell.swift
//  Project-04-Contacts
//
//  Created by Ilgın Akgöz on 22.07.2023.
//

import UIKit

class ContactsDetailCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "ContactsDetailCollectionViewCell"
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
}
