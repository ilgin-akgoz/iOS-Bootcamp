//
//  PickerViewController.swift
//  Project-04-Contacts
//
//  Created by Ilgın Akgöz on 22.07.2023.
//

import UIKit

protocol PickerViewControllerDelegate {
    func didSelectContactType(_ type: ContactType)
}

class PickerViewController: UIViewController {
    static let identifier = "PickerViewController"
    @IBOutlet weak var sectionNameLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var selectedContactType: ContactType?
    
    var delegate: PickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        sectionNameLabel.text = selectedContactType?.contactType ?? "All Contacts"
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        sectionNameLabel.text = selectedContactType?.contactType
        delegate?.didSelectContactType(selectedContactType ?? .allContacts)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    

}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ContactType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ContactType.allCases[row].contactType
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedContactType = ContactType.allCases[row]
        sectionNameLabel.text = selectedContactType?.contactType
    }
}
