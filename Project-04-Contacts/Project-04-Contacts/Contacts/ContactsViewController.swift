//
//  ContactsViewController.swift
//  Project-04-Contacts
//
//  Created by Ilgın Akgöz on 21.07.2023.
//

import UIKit

class ContactsViewController: UIViewController {
    @IBOutlet weak var contactsTableView: UITableView!
    
    private var selectedContactType: ContactType? {
        didSet {
            contactsTableView.reloadData()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        let filterButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle.fill"), style: .done, target: self, action: #selector(filterButtonTapped))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc private func filterButtonTapped() {
        let storyboard = UIStoryboard(name: "PickerViewController", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: PickerViewController.identifier) as? PickerViewController {
            vc.delegate = self
            vc.selectedContactType = selectedContactType
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
    }
    
    let contacts: [Contact] = [
        Contact(name: "Türkcan", type: .friend, gender: .male),
        Contact(name: "Sude", type: .friend, gender: .female),
        Contact(name: "Meral", type: .family, gender: .female),
        Contact(name: "Mahmut", type: .family, gender: .male),
        Contact(name: "Tuana", type: .friend, gender: .female),
        Contact(name: "Naz", type: .bookGroup, gender: .female),
        Contact(name: "Ecem", type: .danceClass, gender: .female),
        Contact(name: "Deniz", type: .bookGroup, gender: .male),
        Contact(name: "Gönenç", type: .family, gender: .male),
        Contact(name: "Sena", type: .danceClass, gender: .female),
        Contact(name: "Mehmet", type: .work, gender: .male),
        Contact(name: "Gizem", type: .friend, gender: .female),
        Contact(name: "Ece", type: .work, gender: .female),
        Contact(name: "Umut", type: .work, gender: .male),
        Contact(name: "Ahmet", type: .work, gender: .male),
        Contact(name: "Polen", type: .bookGroup, gender: .female),
        Contact(name: "Berfin", type: .danceClass, gender: .female),
        Contact(name: "Ayşe", type: .friend, gender: .female),
        Contact(name: "Mert", type: .friend, gender: .male),
        Contact(name: "Zeynep", type: .danceClass, gender: .male),
    ]
}

// MARK: PickerViewControllerDelegate
extension ContactsViewController: PickerViewControllerDelegate {
    func didSelectContactType(_ type: ContactType) {
        selectedContactType = type
    }
}

// MARK: UITableViewDelegate and UITableViewDataSource
extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedContact = filterContacts(indexPath.section)[indexPath.row]
        let otherContacts = filterContacts(indexPath.section)
        let filteredOtherContacts = otherContacts.filter({ $0.name != selectedContact.name})
        let storyboard = UIStoryboard(name: "ContactsDetailViewController", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ContactsDetailViewController.identifier) as? ContactsDetailViewController {
            vc.selectedContact = selectedContact
            vc.otherContacts = filteredOtherContacts
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ContactsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return setSections().count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return setSections()[section].contactType
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.cellIdentifier) as? ContactsTableViewCell else {
            return UITableViewCell()
        }
        cell.contactImage.image = filterContacts(indexPath.section)[indexPath.row].gender.contactImage
        cell.contactNameLabel.text = filterContacts(indexPath.section)[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterContacts(section).count
    }
    
    private func setSections() -> [ContactType] {
        if selectedContactType == nil || selectedContactType == .allContacts {
            return ContactType.allCases
        }
        return [selectedContactType!]
    }
    
    private func filterContacts(_ sectionIndex: Int) -> [Contact] {
        if selectedContactType == nil || selectedContactType == .allContacts {
            return contacts.filter({ $0.type == ContactType.allCases[sectionIndex] })
        }
        return contacts.filter({ $0.type == selectedContactType })
    }
}
