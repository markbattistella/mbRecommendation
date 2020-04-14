//
//  SnackQuestionViewController.swift
//  mbRecommendationSystem
//
//  Created by Mark Battistella on 7/4/20.
//  Copyright © 2020 Mark Battistella. All rights reserved.
//

import UIKit

class SnackQuestionViewController: UIViewController {
    
    // variable: IB
    @IBOutlet var snackQuestionLabel:   UILabel!
    @IBOutlet var snackProgressBar:     UIProgressView!
    @IBOutlet var snackAnswerButton01:  UIButton!
    @IBOutlet var snackAnswerButton02:  UIButton!
    @IBOutlet var snackAnswerButton03:  UIButton!
    @IBOutlet var snackAnswerButton04:  UIButton!
    
    // variable
    var snackQuestions: [SnackQuestion] = [
        SnackQuestion( text: "What type of food would you prefer?",
                       answers: [
                        SnackAnswer( text: "Savoury",           snack: .popcorn        ),
                        SnackAnswer( text: "Hot",               snack: .hotdog        ),
                        SnackAnswer( text: "Cold",              snack: .icecream    ),
                        SnackAnswer( text: "Chewy",             snack: .lollies        )
        ]),
        SnackQuestion( text: "What taste do you prefer?",
                      answers: [
                       SnackAnswer( text: "Buttery",            snack: .popcorn     ),
                       SnackAnswer( text: "Meaty",              snack: .hotdog      ),
                       SnackAnswer( text: "Creamy",             snack: .icecream    ),
                       SnackAnswer( text: "Fruity",             snack: .lollies     )
       ]),
       SnackQuestion( text: "How hungry are you?",
                      answers: [
                       SnackAnswer( text: "Just hungry",        snack: .popcorn     ),
                       SnackAnswer( text: "Very hungry",        snack: .hotdog      ),
                       SnackAnswer( text: "Little hungry",      snack: .icecream    ),
                       SnackAnswer( text: "Not very hungry",    snack: .lollies     )
       ]),
       SnackQuestion( text: "When do you want to eat?",
                      answers: [
                       SnackAnswer( text: "Throughout",         snack: .popcorn     ),
                       SnackAnswer( text: "Before arriving",    snack: .hotdog      ),
                       SnackAnswer( text: "Before it starts",   snack: .icecream    ),
                       SnackAnswer( text: "Sparatically",       snack: .lollies     )
       ]),
    ]
    var snackQuestionIndex = 0
    var snackAnswersChosen: [SnackAnswer] = []

	// shuffle for criteria
	var shuffleQuestions	= [SnackQuestion]()
	var shuffleAnswers		= [SnackAnswer]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
		// shuffle these because I have to
        shuffleQuestions	= shuffleSnackQuestion(stringArray: snackQuestions)
        shuffleAnswers		= shuffleSnackAnswer(stringArray: shuffleQuestions[snackQuestionIndex].answers)

		// method: update the interface
        updateSnackUI()
    }


    // method: update the interface
    func updateSnackUI() {
        
		// if not shuffling
//		let currentQuestion	= snackQuestions[snackQuestionIndex]
//      let currentAnswers	= currentQuestion.answers

		// get current question to index number
		let currentQuestion = shuffleQuestions[snackQuestionIndex]

        // get current answers to index number
		let currentAnswers = shuffleSnackAnswer(stringArray: shuffleQuestions[snackQuestionIndex].answers)

        // get the percentage of completion
        let totalProgress = Float( snackQuestionIndex ) / Float( snackQuestions.count )
        
        
        // set the question label
        snackQuestionLabel.text = currentQuestion.text
        
        // set the question label
        snackProgressBar.setProgress( totalProgress, animated: true )
        
        // set answers into stack
        updateAnswerStack( using: currentAnswers )
        
    }
    
    // method: update the answers stack
    func updateAnswerStack( using answers: [SnackAnswer] ) {
        
        // set the title from the array
        snackAnswerButton01.setTitle( answers[0].text, for: .normal )
        snackAnswerButton02.setTitle( answers[1].text, for: .normal )
        snackAnswerButton03.setTitle( answers[2].text, for: .normal )
        snackAnswerButton04.setTitle( answers[3].text, for: .normal )
    }
    
    // method: IB button pressed
    @IBAction func singleQuestionButtonPressed(_ sender: UIButton) {
        
        let currentAnswers = snackQuestions[snackQuestionIndex].answers
        
        // switch the button, append the answer value
        switch sender {
        case snackAnswerButton01:
            snackAnswersChosen.append( currentAnswers[0] )
        case snackAnswerButton02:
            snackAnswersChosen.append( currentAnswers[1] )
        case snackAnswerButton03:
            snackAnswersChosen.append( currentAnswers[2] )
        case snackAnswerButton04:
            snackAnswersChosen.append( currentAnswers[3] )
        default:
            break
        }
        
        // mthoed: go to next question - or segue
        nextQuestion()
    }
    
    // method: go to the next question
    func nextQuestion() {
        
        // go to next question
        snackQuestionIndex += 1
        
        // if there are still questions continue
        if snackQuestionIndex < snackQuestions.count {
            updateSnackUI()
        // otherwise goto results
        } else {
            performSegue( withIdentifier: "SnackResultSegue", sender: nil )
        }
    }
    
    // force array the answers
    var responsesSnack: [SnackAnswer]!
    
    // navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // if the segue matches go to it
        if segue.identifier == "SnackResultSegue" {
            let resultSnackViewController = segue.destination as! SnackResultViewController
            
			resultSnackViewController.responsesSnack = snackAnswersChosen
        }
        
    }
    
}
