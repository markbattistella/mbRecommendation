//
//  SnackResultViewController.swift
//  mbRecommendation
//
//  Created by Mark Battistella on 11/4/20.
//  Copyright © 2020 Mark Battistella. All rights reserved.
//

import UIKit

class SnackResultViewController: UIViewController {

	@IBOutlet var snackResultImage:	UIImageView!
	@IBOutlet var snackResultTitle:	UILabel!

	@IBOutlet var findASnackButton: UIButton!
	@IBOutlet var restartButton: UIButton!
	@IBOutlet var footerLabel: UILabel!
	
	
	var responsesSnack: [SnackAnswer]!
		
		override func viewDidLoad() {
			super.viewDidLoad()
			
			// method: sum all answers and return recommendation
			calculateSnackResult()
		}
		
		// method: sum the snack answers
		func calculateSnackResult() {
			
			// create the { snack : frequency }
			var frequencyOfAnswers: [Snack: Int] = [:]
			
			let responseTypes = responsesSnack.map { $0.snack }
			
			for response in responseTypes {
				frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
			}
			
			// sort the results for high to low
			let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
			
			// update the IB fields
			snackResultImage.image	= mostCommonAnswer.recommendation.snackImage.image
			snackResultTitle.text	= mostCommonAnswer.recommendation.snackTitle
			snackResultTitle.textColor	= mostCommonAnswer.recommendation.snackFont
			findASnackButton.setTitleColor(mostCommonAnswer.recommendation.snackFont, for: .normal)
			restartButton.setTitleColor(mostCommonAnswer.recommendation.snackFont, for: .normal)
			footerLabel.textColor 	= mostCommonAnswer.recommendation.snackFont

			// update the view background to match snack
			view.backgroundColor	= mostCommonAnswer.recommendation.snackColour
		}
	}
