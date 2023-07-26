//
//  ContactsDetailViewController.swift
//  Project-04-Contacts
//
//  Created by Ilgın Akgöz on 22.07.2023.
//

import UIKit

class ContactsDetailViewController: UIViewController {
    static let identifier = "ContactsDetailViewController"
    @IBOutlet weak var contactsDetailCollectionView: UICollectionView!
    @IBOutlet weak var selectedContactImage: UIImageView!
    @IBOutlet weak var selectedContactNameLabel: UILabel!
    @IBOutlet weak var selectedContactTypeLabel: UILabel!
    
    var selectedContact: Contact?
    var otherContacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsDetailCollectionView.dataSource = self

        if let selectedContact {
            selectedContactImage.image = selectedContact.gender.contactImage
            selectedContactNameLabel.text = selectedContact.name
            selectedContactTypeLabel.text = selectedContact.type.contactType
        }
    }
}

extension ContactsDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        otherContacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactsDetailCollectionViewCell.cellIdentifier, for: indexPath) as? ContactsDetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.contactImage.image = otherContacts[indexPath.row].gender.contactImage
        cell.contactNameLabel.text = otherContacts[indexPath.row].name
        return cell
    }
}
