//
//  AddToDoViewController.swift
//  ToDo
//
//  Created by Ilgın Akgöz on 1.08.2023.
//

import UIKit

class AddToDoViewController: UIViewController {
    @IBOutlet weak var addToDoField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        if let newToDo = addToDoField.text {
            addToDo(item: newToDo)
        }
    }
    
    private func addToDo(item: String) {
        print("Added to do: \(item)")
    }
}
