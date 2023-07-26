//
//  ContactsTableViewCell.swift
//  Project-04-Contacts
//
//  Created by Ilgın Akgöz on 21.07.2023.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    static let cellIdentifier = "ContactsTableViewCell"
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
