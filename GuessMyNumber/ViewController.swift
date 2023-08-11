//
//  ViewController.swift
//  GuessMyNumber
//
//  Created by Brian Foutty on 5/9/23.
//

import UIKit

class ViewController: UIViewController {
    // #1  - set up UI in Main
    
    // MARK: - IB Outlets
    // #2 - connect outlets in Assistant Editor
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    
    // MARK: - Instance Properties
    // #4 - create these three properties
    var guesses = 0
    var randomNumber = 50
    var playerGuess = ""
    
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateRandomNumber()
    }
    
    // MARK: - IB Actions
    // #4 - connect submit button in Assistant Editor
    @IBAction func submitButtonTapped(_ sender: Any) {
        checkNumber()
    }
    
    // MARK: - Instance Methods
    // generate a random number
    func generateRandomNumber() {
        randomNumber = Int.random(in: 1...100)
        print(randomNumber)
    }
    
    func checkNumber() {
        let playerGuess = Int(numberTextField.text ?? "50")
            
            if playerGuess == randomNumber {
                hintLabel.text = "EXCELLENT! You guessed the number!🥳"
                scoreLabel.text = "You guessed the number in \(guesses) guesses."
            } else if playerGuess ?? 50 > randomNumber {
                guesses += 1
                hintLabel.text = "⬇️ Your guess is greater than the number."
            } else {
                guesses += 1
                hintLabel.text? = "⬆️ Your guess is less than the number."
            }
    }
    

}

