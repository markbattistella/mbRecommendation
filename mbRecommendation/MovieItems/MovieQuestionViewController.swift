//
//  MovieQuestionViewController.swift
//  mbRecommendationSystem
//
//  Created by Mark Battistella on 7/4/20.
//  Copyright © 2020 Mark Battistella. All rights reserved.
//

import UIKit

class MovieQuestionViewController: UIViewController {
	
	// variable: IB
	@IBOutlet var movieQuestionLabel:	UILabel!
	@IBOutlet var movieProgressBar:		UIProgressView!
	@IBOutlet var movieAnswerButton01:	UIButton!
	@IBOutlet var movieAnswerButton02:	UIButton!
	@IBOutlet var movieAnswerButton03:	UIButton!
	@IBOutlet var movieAnswerButton04:	UIButton!
	
	// variable
	var movieQuestions: [MovieQuestion] = [
		MovieQuestion( text: "What genre do you prefer?",
					   answers: [
						MovieAnswer( text: "Comedy",     movie: .theMask		),
						MovieAnswer( text: "Romance",    movie: .serendipity	),
						MovieAnswer( text: "Horror",     movie: .theEvildDead	),
						MovieAnswer( text: "Sci-Fi",     movie: .looper			)
		]),
		MovieQuestion( text: "What streaming service to use?",
					   answers: [
						MovieAnswer( text: "Foxtel",     movie: .theMask		),
						MovieAnswer( text: "Stan",       movie: .serendipity	),
						MovieAnswer( text: "Youtube",    movie: .theEvildDead	),
						MovieAnswer( text: "Netflix",    movie: .looper			)
		]),
		MovieQuestion( text: "What era film to see?",
					   answers: [
						MovieAnswer( text: "1990s",		movie: .theMask			),
						MovieAnswer( text: "2000s",		movie: .serendipity		),
						MovieAnswer( text: "1980s",		movie: .theEvildDead	),
						MovieAnswer( text: "2010s",		movie: .looper			)
		]),
		MovieQuestion( text: "IMdB rating",
					   answers: [
						MovieAnswer( text: "7.0 - 7.4",	movie: .theMask			),
						MovieAnswer( text: "6.0 - 6.9",	movie: .serendipity		),
						MovieAnswer( text: "7.5 - 7.9",	movie: .theEvildDead	),
						MovieAnswer( text: "8.0 - 8.9",	movie: .looper			)
		])
	]
	var movieQuestionIndex = 0
	var movieAnswersChosen: [MovieAnswer] = []

	// shuffle for criteria
	var shuffleQuestions	= [MovieQuestion]()
	var shuffleAnswers		= [MovieAnswer]()
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// shuffle these because I have to
        shuffleQuestions	= shuffleMovieQuestion(stringArray: movieQuestions)
        shuffleAnswers		= shuffleMovieAnswer(stringArray: shuffleQuestions[movieQuestionIndex].answers)

		// method: update the interface
		updateMovieUI()
	}


	// method: update the interface
	func updateMovieUI() {

		// get current question to index number
//		let currentQuestion = movieQuestions[movieQuestionIndex]		// if not shuffling
		let currentQuestion = shuffleQuestions[movieQuestionIndex]
		
		// get current answers to index number
//		let currentAnswers = currentQuestion.answers
		let currentAnswers = shuffleMovieAnswer(stringArray: shuffleQuestions[movieQuestionIndex].answers)
		
		// get the percentage of completion
		let totalProgress = Float( movieQuestionIndex ) / Float( movieQuestions.count )
		
		
		// set the question label
		movieQuestionLabel.text = currentQuestion.text
		
		// set the question label
		movieProgressBar.setProgress( totalProgress, animated: true )
		
		// set answers into stack
		updateAnswerStack( using: currentAnswers )
		
	}
	
	// method: update the answers stack
	func updateAnswerStack( using answers: [MovieAnswer] ) {
		
		// set the title from the array
		movieAnswerButton01.setTitle( answers[0].text, for: .normal )
		movieAnswerButton02.setTitle( answers[1].text, for: .normal )
		movieAnswerButton03.setTitle( answers[2].text, for: .normal )
		movieAnswerButton04.setTitle( answers[3].text, for: .normal )
	}
	
	// method: IB button pressed
	@IBAction func singleQuestionButtonPressed(_ sender: UIButton) {
		
		let currentAnswers = movieQuestions[movieQuestionIndex].answers
		
		// switch the button, append the answer value
		switch sender {
		case movieAnswerButton01:
			movieAnswersChosen.append( currentAnswers[0] )
		case movieAnswerButton02:
			movieAnswersChosen.append( currentAnswers[1] )
		case movieAnswerButton03:
			movieAnswersChosen.append( currentAnswers[2] )
		case movieAnswerButton04:
			movieAnswersChosen.append( currentAnswers[3] )
		default:
			break
		}
		
		// mthoed: go to next question - or segue
		nextQuestion()
	}
	
	// method: go to the next question
	func nextQuestion() {
		
		// go to next question
		movieQuestionIndex += 1
		
		// if there are still questions continue
		if movieQuestionIndex < movieQuestions.count {
			updateMovieUI()
		// otherwise goto results
		} else {
			performSegue( withIdentifier: "MovieResultSegue", sender: nil )
		}
	}
	
	// force array the answers
	var responses: [MovieAnswer]!
	
	// navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		// if the segue matches go to it
		if segue.identifier == "MovieResultSegue" {
			let resultMovieViewController = segue.destination as! MovieResultViewController
			
			resultMovieViewController.responses = movieAnswersChosen
		}
		
	}
	
}
