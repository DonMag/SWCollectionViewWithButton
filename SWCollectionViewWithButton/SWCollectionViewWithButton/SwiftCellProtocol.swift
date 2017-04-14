//
//  SwiftCellProtocol.swift
//  SWCollectionViewWithButton
//
//  Created by Don Mag on 4/14/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

public protocol CellEditable {
	
	func deleteElement()
//	func startBeingAfraid()
//	func stopBeingAfraid()
	
}

public extension CellEditable where Self: UICollectionViewCell {
	
	//
	// I can't make this button work. addTarget doesn't bind correctly and never gets fired when I tap it.
	//

	var removeButton: UIButton? {
		get {
			let tag = 666
			if let removeButton = self.contentView.viewWithTag(tag) as? UIButton {
				return removeButton
			} else {
				let removeButton = UIButton(frame: CGRect(x: 10, y: 10, width: 25, height: 25))
				removeButton.isUserInteractionEnabled = true
				removeButton.translatesAutoresizingMaskIntoConstraints = false
				removeButton.layer.cornerRadius = (removeButton.frame.size.width / 2.0) as CGFloat
				removeButton.clipsToBounds = true
				removeButton.backgroundColor = .blue // SQThemeManager.currentTheme().color.accentDark
				removeButton.tag = tag
				removeButton.setTitle("x", for: .normal)
				return removeButton
			}
		}
	}

//	var removeButton: Button? {
//		get {
//			let tag = 666
//			if let removeButton = self.contentView.viewWithTag(tag) as? Button {
//				return removeButton
//			} else {
//				let removeButton = Button(frame: CGRect(x: 10, y: 10, width: 25, height: 25))
//				removeButton.isUserInteractionEnabled = true
//				removeButton.translatesAutoresizingMaskIntoConstraints = false
//				removeButton.layer.cornerRadius = (removeButton.frame.size.width / 2.0) as CGFloat
//				removeButton.clipsToBounds = true
//				removeButton.backgroundColor = SQThemeManager.currentTheme().color.accentDark
//				removeButton.tag = tag
//				removeButton.setImage(Icon.close, for: .normal)
//				removeButton.tintColor = .white
//				return removeButton
//			}
//		}
//	}
	
	
	/// Makes the cell frame wiggle
	func startBeingAfraid() {
		
		let angleLeft = CGFloat((-5.0 * Double.pi) / 180.0)
		let angleRight = CGFloat((5.0 * Double.pi) / 180.0)
		
		if let rmButton = self.removeButton {
			
			// changed this
//			self.addSubview(rmButton)
			
			// to this
			self.contentView.addSubview(rmButton)
			
			NSLayoutConstraint.activate([rmButton.topAnchor.constraint(equalTo: self.topAnchor),
			                             rmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			                             rmButton.widthAnchor.constraint(equalToConstant: 25),
			                             rmButton.heightAnchor.constraint(equalToConstant: 25)])
			
		}
		
		self.contentView.transform = CGAffineTransform(rotationAngle: angleLeft)
		
		UIView.animate(withDuration: 0.15,
		               delay: 0,
		               options: [.allowUserInteraction, .autoreverse, .repeat],
		               animations: {
						self.contentView.transform = CGAffineTransform(rotationAngle: angleRight)
		}, completion: nil)
	}
	
	
	/// Stops the cell frame to wiggle
	func stopBeingAfraid() {
		
		UIView.animate(withDuration: 0.15,
		               delay: 0,
		               options: [.allowUserInteraction, .beginFromCurrentState, .curveEaseOut],
		               animations: {
						self.contentView.transform = CGAffineTransform.identity
		}, completion: nil)
		
		if let rmButton = self.removeButton {
			self.removeConstraints(rmButton.constraints)
			self.removeButton?.removeFromSuperview()
			self.setNeedsLayout()
			self.layoutIfNeeded()
		}
	}
}
