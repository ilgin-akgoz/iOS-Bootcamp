//
//  AddToDoViewController.swift
//  ToDo
//
//  Created by Ilgın Akgöz on 1.08.2023.
//

import UIKit

class AddToDoViewController: UIViewController {
    @IBOutlet weak var addToDoField: UITextField!
    
    var viewModel = AddToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        if let newToDo = addToDoField.text {
            viewModel.addToDo(item: newToDo)
        }
    }
}
