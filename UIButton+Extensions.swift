//
//  UIButton+Extensions.swift
//  
//
//  Created by Jobins John on 9/2/19.
//

import Foundation

extension UIButton {
	
	//MARK: — wiggle() => Wiggles the button in x axis.
	func wiggle() {
		let wiggleAnim = CABasicAnimation(keyPath: "position")
		wiggleAnim.duration = 0.05
		wiggleAnim.repeatCount = 5
		wiggleAnim.autoreverses = true
		wiggleAnim.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
		wiggleAnim.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
		layer.add(wiggleAnim, forKey: "position")
	}
	/*
		Button.wiggle()
	*/
	
	//MARK: — dim() => Button color would gets dimmed and reverses.
	func dim() {
		UIView.animate(withDuration: 0.15, animations: {
			self.alpha = 0.75
		}) { (finished) in
			UIView.animate(withDuration: 0.15, animations: {
				self.alpha = 1.0
			})
		}
	}
	/*
		Button.dim()
	*/
	
	//MARK: — colorize() => Provides a random color to button.
	func colorize() {
		let randomNumberArray = generateRandomnumbers(quantity: 3)
		let randomColor = UIColor(red: randomNumberArray[0]/255, green: randomNumberArray[1]/255, blue: randomNumberArray[2]/255, alpha: 1.0)
		UIView.animate(withDuration: 0.3) {
			self.backgroundColor = randomColor
		}
	}
	/*
		Button.colorize()
	*/
	
	func verticalAlignImageAndTitle(padding: CGFloat = 5.0, isTitleUnderImage: Bool = true) {
		let imageSize = self.imageView!.frame.size
		let titleSize = self.titleLabel!.frame.size
		
		if isTitleUnderImage {
			self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -(imageSize.height + padding), 0)
			self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + padding), 0, 0, -titleSize.width)
		} else {
			self.titleEdgeInsets = UIEdgeInsetsMake(-(imageSize.height + padding), -imageSize.width, 0, 0)
			self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, -(titleSize.height + padding), -titleSize.width)
		}
	}
	/*
	let myButton = UIButton()
	myButton.setTitle("Button", for: .normal)
	myButton.setImage(UIImage(named: "image_name"), for: .normal)
	addSubview(myButton)
	myButton.verticalAlignImageAndTitle(padding: 6.0, isTitleUnderImage: false)
	*/
}
