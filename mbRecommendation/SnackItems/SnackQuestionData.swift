//
//  SnackQuestionData.swift
//  mbRecommendationSystem
//
//  Created by Mark Battistella on 8/4/20.
//  Copyright © 2020 Mark Battistella. All rights reserved.
//

import UIKit

// create the question struct
struct SnackQuestion {
	var text: String
	var answers: [SnackAnswer]
}

// create the answer struct
struct SnackAnswer {
	var text: String
	var snack: Snack
}

// create the snack struct
struct SnackStruct {
	let snackTitle:		String
	let snackImage:	    UIImageView
	let snackColour:	UIColor
	let snackFont:		UIColor
}

//
enum Snack {
	
	// create the outputs
	case popcorn, hotdog, icecream, lollies
	
	// create the recommendations
	var recommendation: SnackStruct {
		
		switch self {
		case .popcorn:
			return SnackStruct(
				snackTitle:		"Popcorn",
				snackImage:	    UIImageView( image: UIImage(named: "snackPopcorn")! ),
				snackColour:	.yellow,
				snackFont:		.black
			)
			
		case .hotdog:
			return SnackStruct(
				snackTitle:		"Hotdog",
                snackImage:     UIImageView( image: UIImage(named: "snackHotdog")! ),
				snackColour:	.brown,
				snackFont:		.white
			)
			
		case .icecream:
			return SnackStruct(
				snackTitle:		"Icecream",
                snackImage:     UIImageView( image: UIImage(named: "snackIcecream")! ),
				snackColour:	.white,
				snackFont:		.gray
			)
			
		case .lollies:
			return SnackStruct(
				snackTitle:		"Lollies",
                snackImage:     UIImageView( image: UIImage(named: "snackLollies")! ),
				snackColour:	UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1),
				snackFont:		.black
			)
		}
	}
}
