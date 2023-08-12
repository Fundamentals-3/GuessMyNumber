//
//  ViewController.swift
//  GuessMyNumber
//
//  Created by Brian Foutty on 5/9/23.
//  Teaching steps and notes are at bottom of file.
//  #1  - set up UI in Main

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    // #2
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    
    // MARK: - Instance Properties
    // #3
    var guesses = 0
    var randomNumber = 50
    var playerGuess = ""
    
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        // #26
        scoreLabel.text = ""
        hintLabel.text = ""
        
        // #7
        generateRandomNumber()
        // #8
        
    }
    
    // MARK: - IB Actions
    // #4
    @IBAction func submitButtonTapped(_ sender: Any) {
        // #24
        checkNumber()
    }
    
    // MARK: - Instance Methods
    // #5
    func generateRandomNumber() {
        randomNumber = Int.random(in: 1...100)
        // #6
        print(randomNumber)
    }
    
    // #9
    func getGuessedNumber() -> Int? {
        // #10
        guard let playerGuessText = self.numberTextField.text,
              // #11
              let playerGuess = Int(playerGuessText) else
        {
            // #13
            //print(playerGuess)
            //print("There is no number entered.")
            
            // #17
            hintLabel.text = "Please enter a number."
            scoreLabel.text = ""
            // #18
            hintLabel.textColor = .red
            
            return nil // #12 - else return nil
        }
        
        return playerGuess // #14
        // #15
    }
    
    // #19
    func checkNumber() {
        // #20
        if let playerGuess = getGuessedNumber() {
            
            // #21
            if playerGuess == randomNumber {
                hintLabel.text = "EXCELLENT! You guessed the number!🥳"
                scoreLabel.text = "You guessed the number in \(guesses) guesses."
                hintLabel.textColor = .blue
            // #22
            } else if playerGuess > randomNumber {
                guesses += 1
                hintLabel.text = "⬇️ Your guess is greater than the number."
                scoreLabel.text = ""
                hintLabel.textColor = .black
            // #23
            } else {
                guesses += 1
                hintLabel.text? = "⬆️ Your guess is less than the number."
                scoreLabel.text = ""
                hintLabel.textColor = .black
            } // #25
        }
    }
}

// #1  - Set up UI in Main.
// #2 - Connect outlets in Assistant Editor.
// #3 - Create three properties to store user guesses for score, a random number with a default value of any number, and a player guess which is an empty String since a textField which ALWAYS returns String. So, it must be a string.
// #4 - Connect submit button in Assistant Editor.
// #5 - Create a function to generate a random number between 1 and any other number. I used 100 so that game will not take too long to play.
// #6 - Create a print statement to check that the generateRandomNumber() function works on 1st Build & Run.
// #7 - Call generateRandomNumber() in ViewDidLoad() to generate the first random number upon game launch.
// #8 - Build & run. Observe random number generated. Run again to check for different random number.
// #9 - Create the getGuessedNumber() function that returns an optional Int to get the player's number they guessed and return it as an Int if there is a number. Use optional binding to check if there is a number and if not return nil.
// #10 - Unwrap the player number guess from the text field if there is one. If there is one keep the value throughout the code block.
// #11 - Cast the player number guess as an Int else...
// #12 - else return nil
// #13 - Create print statements to capture number and a statement if there is not a number entered.
// #14 - Required return statement that returns the Int value of the player guess if there is one.
// #15 - Build & run. Enter a number. Observe the output to the console.
// #16 - Build & run again. Do NOT enter a number and hit Submit button. Observe the output in the console.
// #17 - How can we handle user error? How can we let them know to enter a number? Update the labels.
// #18 - How can we make the message to the user more obvious? Change the font color.
// #19 - Create a function checkNumber() that checks the player guessed number against the randomly generated number.
// #20  - Unwrap the optional Int that is the player's guessed the number using optional binding.
// #21 - Create conditional to check if the player's guess is the same as the random number. Assign values to the hint and the score labels. Update the font color. else...
// #22 - If player's guess is bigger than the random number, assign the values to the hintLabel. Assign the scoreLabel to a blank string and set the hintLabels text color to black.
// #23 - If player's guess is smaller than the random number, assign the values to the hintLabel. Assign the scoreLabel to a blank string and set the hintLabels text color to black.
// #24 - Call checkNumber() in submitButtonTapped().
// #25 - Build & Run. Play a few times. Ask for UI problems.
// #26 - Assign the scoreLabel and hintLabel to blank Strings in the VDL so they are invsible.


