//
//  MovieQuestionData.swift
//  mbRecommendationSystem
//
//  Created by Mark Battistella on 8/4/20.
//  Copyright © 2020 Mark Battistella. All rights reserved.
//

import UIKit

// create the question struct
struct MovieQuestion {
	var text: String
	var answers: [MovieAnswer]
}

// create the answer struct
struct MovieAnswer {
	var text: String
	var movie: Movie
}

// create the movie struct
struct MovieStruct {
	let movieTitle:		String
	let moviePoster:	UIImageView
	let movieColour:	UIColor
	let movieFont:		UIColor
}

//
enum Movie {
	
	// create the outputs
	case theMask, serendipity, theEvildDead, looper
	
	// create the recommendations
	var recommendation: MovieStruct {
		
		switch self {
		case .theMask:
			return MovieStruct(
				movieTitle:		"The Mask (1994)",
				moviePoster:	UIImageView( image: UIImage(named: "posterTheMask")! ),
				movieColour:	UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1),
				movieFont:		UIColor(red: 33/255, green: 3/255, blue: 3/255, alpha: 1)
			)
			
		case .serendipity:
			return MovieStruct(
				movieTitle:		"Serendipity (2001)",
				moviePoster: 	UIImageView( image: UIImage(named: "posterSerendipity")! ),
				movieColour:	.systemPink,
				movieFont:		UIColor(red: 33/255, green: 3/255, blue: 3/255, alpha: 1)
			)
			
		case .theEvildDead:
			return MovieStruct(
				movieTitle:		"The Evil Dead (1984)",
				moviePoster: 	UIImageView( image: UIImage(named: "posterTheEvilDead")! ),
				movieColour:	.black,
				movieFont:		.white
			)
			
		case .looper:
			return MovieStruct(
				movieTitle:		"Looper (2012)",
				moviePoster: 	UIImageView( image: UIImage(named: "posterLooper")! ),
				movieColour:	UIColor(red: 236/255, green: 240/255, blue: 241/255, alpha: 1),
				movieFont:		.black
			)
		}
	}
}
