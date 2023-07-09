//
//  ResultViewController.swift
//  Project 02 - Rock Paper Scissors App
//
//  Created by Ilgın Akgöz on 7.07.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playerMoveLabel: UILabel!
    @IBOutlet weak var computerMoveLabel: UILabel!
    @IBOutlet weak var moveView: UIView!
    
    var resultText = ""
    var playerMove = ""
    var computerMove = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Result"
        
        resultLabel.text = resultText
        playerMoveLabel.text = playerMove
        computerMoveLabel.text = computerMove
        moveView.layer.cornerRadius = 20
    }
}

