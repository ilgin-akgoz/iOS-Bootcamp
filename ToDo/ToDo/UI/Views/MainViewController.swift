//
//  MainViewController.swift
//  ToDo
//
//  Created by Ilgın Akgöz on 1.08.2023.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func detailButtonTapped(_ sender: Any) {
        let toDo = ToDo(id: 1, name: "Fill out the survey")
        performSegue(withIdentifier: "DetailViewController", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewController" {
            if let toDo = sender as? ToDo {
                let destinationVC = segue.destination as! DetailViewController
                destinationVC.toDo = toDo
            }
        }
    }
}
