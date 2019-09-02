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
	
	//MARK: — verticalAlignImageAndTitle() => Provides Button with image & Title vertically aligned.
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
	
	
	//MARK: — startLoading() => Start loading animation in button.
	func startLoading(color: UIColor) {
		
		let shapeOuter = shapeLayerOuter(color: color)
		let shapeInner = shapeLayerInner(color: color)
		
		shapeOuter.add(animationOuter(), forKey: nil)
		shapeInner.add(animationInner(), forKey: nil)
		
		self.layer.addSublayer(shapeOuter)
		self.layer.addSublayer(shapeInner)
		
	}
	//MARK: — stopLoading() => Stop loading animation in button.
	func stopLoading(){
		
		UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
			self.alpha = 0
		}) { (true) in
			self.layer.removeFromSuperlayer()
		}
		
	}
	
	//MARK: — stopLoading() => Stop loading animation in button.
	func roundedButtonWithAvatarImage(image: UIImage, borderWidth: CGFloat = 1.0, borderColor: CGColor = UIColor.whiteColor().CGColor) {
		self.setImage(image, forState: .Normal)
		self.layer.cornerRadius = self.frame.size.width / 2
		self.layer.borderWidth = borderWidth
		self.layer.borderColor = borderColor
		self.clipsToBounds = true
	}
	
	func roundedButtonWithAvatarImageData(imageData: NSData, borderWidth: CGFloat = 1.0, borderColor: CGColor = UIColor.whiteColor().CGColor) {
		self.roundedButtonWithAvatarImage(UIImage(data: imageData)!, borderWidth: borderWidth, borderColor: borderColor)
	}
	/*
		Button.roundedButtonWithAvatarImage(UIImage(named: "image_name")!, borderWidth: 1, borderColor: UIColor.blueColor().CGColor)
	*/
	
	//MARK: — round() => Set corner radius for button.
	func round() {
		layer.cornerRadius = bounds.height / 2
		clipsToBounds = true
	}
	
	//MARK: — bounce() => Make button bounce.
	func bounce() {
		UIView.animate(withDuration: 0.1, animations: {
			self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
		}) { (completion) in
			UIView.animate(withDuration: 0.1, animations: {
				self.transform = .identity
			})
		}
	}
	
	//MARK: — shine() => make button shine.
	func shine() {
		UIView.animate(withDuration: 0.1, animations: {
			self.alpha = 0.5
		}) { (completion) in
			UIView.animate(withDuration: 0.1, animations: {
				self.alpha = 1
			})
		}
	}
	
	//MARK: — jump() => Makes button jump.
	func jump() {
		UIView.animate(withDuration: 0.1, animations: {
			self.transform = CGAffineTransform(translationX: 0, y: -10)
		}) { (completion) in
			UIView.animate(withDuration: 0.1, animations: {
				self.transform = .identity
			})
		}
	}
	
	
	
	
	//MARK: — HELPER FUNCTIONS SECTION
	
	//Helper functions for startLoading() & stopLoading()
	private func shapeLayerOuter(color: UIColor) -> CAShapeLayer{
		
		let circleOut = UIBezierPath(arcCenter: CGPoint(x: self.bounds.midX, y: self.bounds.midY),
									 radius: CGFloat(self.bounds.height * 0.4),
									 startAngle: CGFloat(0),
									 endAngle:CGFloat(Double.pi * 2),
									 clockwise: true)
		
		
		let shapeLayerOut = CAShapeLayer()
		shapeLayerOut.path = circleOut.cgPath
		shapeLayerOut.fillColor = UIColor.clear.cgColor
		shapeLayerOut.strokeColor = color.cgColor
		shapeLayerOut.strokeStart = 0.1
		shapeLayerOut.strokeEnd = 1
		shapeLayerOut.lineWidth = 3.5
		shapeLayerOut.lineCap = "round"
		shapeLayerOut.frame = self.bounds
		
		return shapeLayerOut
		
	}
	//Helper functions for startLoading() & stopLoading()
	private func shapeLayerInner(color: UIColor) -> CAShapeLayer{
		
		let circleIn = UIBezierPath(arcCenter: CGPoint(x: self.bounds.midX, y: self.bounds.midY),
									radius: CGFloat(self.bounds.height * 0.2),
									startAngle: CGFloat(0),
									endAngle: CGFloat(Double.pi * 2),
									clockwise: false)
		
		let shapeLayerIn = CAShapeLayer()
		shapeLayerIn.path = circleIn.cgPath
		shapeLayerIn.fillColor = UIColor.clear.cgColor
		shapeLayerIn.strokeColor = color.cgColor
		shapeLayerIn.strokeStart = 0.1
		shapeLayerIn.strokeEnd = 1
		shapeLayerIn.lineWidth = 3.2
		shapeLayerIn.lineCap = "round"
		shapeLayerIn.frame = self.bounds
		
		return shapeLayerIn
		
	}
	//Helper functions for startLoading() & stopLoading()
	private func animationOuter() -> CABasicAnimation{
		let animationOut = CABasicAnimation(keyPath: "transform.rotation")
		animationOut.fromValue = 0
		animationOut.toValue = Double.pi * 2
		animationOut.duration = 1
		animationOut.repeatCount = Float.infinity
		
		return animationOut
	}
	//Helper functions for startLoading() & stopLoading()
	private func animationInner() -> CABasicAnimation {
		
		let animationIn = CABasicAnimation(keyPath: "transform.rotation")
		animationIn.fromValue = 0
		animationIn.toValue = -(Double.pi * 2)
		animationIn.duration = 1
		animationIn.repeatCount = Float.infinity
		
		return animationIn
		
	}
}
