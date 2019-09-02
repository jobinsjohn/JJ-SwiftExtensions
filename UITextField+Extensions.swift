//
//  UITextField+Extensions.swift
//  
//
//  Created by Jobins John on 9/2/19.
//

import Foundation
import UIKit

extension UITextField {
	
	//MARK: — initTextFieldWithImage() => TextField with image & Placeholder text.
	func initTextFieldWithImage(image image: UIImage, andPlaceHolder placeHolder: String){
		self.placeholder = placeHolder
		self.background = UIImage(named: "TextFieldBG")
		self.borderStyle = .RoundedRect
		let imageViewHeight: CGFloat = self.frame.height * 2 / 3
		let imageView = UIImageView(frame: CGRectMake(5, 0, imageViewHeight, imageViewHeight))
		imageView.image = image
		imageView.contentMode = .Center
		self.leftView = imageView
		self.leftViewMode = UITextFieldViewMode.Always
	}
	/*
		textField.initTextFieldWithImage(image: UIImage(named: "image_name")!, andPlaceHolder: "sample_placeholder_text")
	*/
	
	//MARK: — configureTextfield() => TextField with color, font, cornerradius, bordercolor, backgroundcolor,borderwidth
	//FIXME: To be tested
	
	func configureTextfield(color: UIColor = .blue,
				   font: UIFont = UIFont.boldSystemFont(ofSize: 12),
				   cornerRadius: CGFloat,
				   borderColor: UIColor? = nil,
				   backgroundColor: UIColor,
				   borderWidth: CGFloat? = nil) {
		if let borderWidth = borderWidth {
			self.layer.borderWidth = borderWidth
		}
		if let borderColor = borderColor {
			self.layer.borderColor = borderColor.cgColor
		}
		self.layer.cornerRadius = cornerRadius
		self.font = font
		self.textColor = color
		self.backgroundColor = backgroundColor
	}
	/*
	textField.initTextFieldWithImage(image: UIImage(named: "image_name")!, andPlaceHolder: "sample_placeholder_text")
	*/
}
