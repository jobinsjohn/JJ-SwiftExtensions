//
//  ExtensionHelpers.swift
//  
//
//  Created by Jobins John on 9/2/19.
//

import Foundation
import UIKit

func generateRandomNumbers(quantity: Int) -> [CGFloat] {
	var randomNumArray = [CGFloat]()
	for _ in 1...quantity {
		let randomNumber = CGFloat(arc4random_uniform(255))
		randomNumArray.append(randomNumber)
	}
	return randomNumArray
}
