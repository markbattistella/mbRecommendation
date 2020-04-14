//
//  ViewController.swift
//  mbRecommendationSystem
//
//  Created by Mark Battistella on 7/4/20.
//  Copyright © 2020 Mark Battistella. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    // variable: IB
    @IBOutlet var choiceHeadingLabel:   UILabel!
    @IBOutlet var choiceButton1:        UIButton!
    @IBOutlet var choiceButton2:        UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// do some cosmetic fixes
		choiceHeadingLabel.text = "CHOOSE ONE"
		choiceButton1.setTitle("M O V I E", for: .normal)
		choiceButton2.setTitle("S N A C K", for: .normal)
	}
    
	@IBAction func unwind(unwindSegue: UIStoryboardSegue){}

}
