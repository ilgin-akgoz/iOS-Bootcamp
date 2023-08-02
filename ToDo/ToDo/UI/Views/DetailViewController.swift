//
//  DetailViewController.swift
//  ToDo
//
//  Created by Ilgın Akgöz on 1.08.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var updateToDoField: UITextField!
    var toDo: ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDo {
            updateToDoField.text = toDo.name
        }
    }

    @IBAction func updateButtonTapped(_ sender: Any) {
        if let updatedToDo = updateToDoField.text {
            updateToDo(item: updatedToDo)
        }
    }
    
    private func updateToDo(item: String) {
        print("Updated to do: \(item)")
    }

}
