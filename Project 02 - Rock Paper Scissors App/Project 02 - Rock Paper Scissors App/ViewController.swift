//
//  ViewController.swift
//  Project 02 - Rock Paper Scissors App
//
//  Created by Ilgın Akgöz on 7.07.2023.
//

import UIKit

enum Move: String {
    case rock = "🪨"
    case paper = "📃"
    case scissors = "✂️"
}

class ViewController: UIViewController {
    private var playerScore = 0
    private var computerScore = 0
    
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var computerScoreLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    var resultText = ""
    var playerMove = ""
    var computerMove: Move = .rock
    
    private var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Rock Paper Scissors"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(resetScores))
        
        setUpButtons()
        buttonView.layer.cornerRadius = 20
        setUpActivityIndicator()
    }
    
    private func setUpActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        buttonView.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor)
        ])
    }
    
    private func setUpButtons() {
        rockButton.setTitle("🪨", for: .normal)
        paperButton.setTitle("📃", for: .normal)
        scissorsButton.setTitle("✂️", for: .normal)
        
        rockButton.layer.cornerRadius = 30
        paperButton.layer.cornerRadius = 30
        scissorsButton.layer.cornerRadius = 30
    }
    
    @objc private func resetScores() {
        playerScore = 0
        computerScore = 0
        playerScoreLabel.text = "Your score: 0"
        computerScoreLabel.text = "Computer score: 0"
    }
    
    @IBAction func rockButtonTapped(_ sender: Any) {
        playGame(playerMove: .rock)
    }
    
    @IBAction func paperButtonTapped(_ sender: Any) {
        playGame(playerMove: .paper)
    }
    
    @IBAction func scissorsButtonTapped(_ sender: Any) {
        playGame(playerMove: .scissors)
    }
    
    @IBAction func resultButton(_ sender: Any) {
        updateScores()
        performSegue(withIdentifier: "ResultViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultViewController" {
            guard let resultVC = segue.destination as? ResultViewController else { return }
            
            resultVC.resultText = resultText
            resultVC.playerMove = "Your move: \(playerMove)"
            resultVC.computerMove = "Computer move: \(computerMove.rawValue)"
        }
    }
    
    private func playGame(playerMove: Move) {
        self.playerMove = playerMove.rawValue
        computerMove = getComputerMove()
        
        showActivityIndicator()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            switch (playerMove, self.computerMove) {
            case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
                self.resultText = "You won! 🎉"
                self.playerScore += 1
            case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
                self.resultText = "You lost 😞"
                self.computerScore += 1
            default:
                self.resultText = "It's a tie!"
            }
            
            self.hideActivityIndicator()
        }
    }
    
    private func getComputerMove() -> Move {
        let moves: [Move] = [.rock, .paper, .scissors]
        let randomMove = moves.randomElement()!
        return randomMove
    }
    
    private func updateScores() {
        playerScoreLabel.text = "Your score: \(playerScore)"
        computerScoreLabel.text = "Computer score: \(computerScore)"
    }
    
    private func showActivityIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    private func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}

