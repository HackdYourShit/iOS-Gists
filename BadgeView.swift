//
//  BadgeView.swift
//  Tellco
//
//  Created by Najdan Tomic on 4/6/17.
//  Copyright © 2017 Tellco. All rights reserved.
//

import Foundation
import UIKit

class BadgeView: UIView {
	var position: BadgePosition = .default

	convenience init(text: String, badgeColor: UIColor, position: BadgePosition = .default, textColor: UIColor = UIColor.white, padding: CGFloat = 1) {
		self.init()
		self.position = position
		let count = text.characters.count
		let fontSize: CGFloat = 12
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: fontSize)
		label.textColor = textColor
		label.backgroundColor = badgeColor
		label.text = text
		label.textAlignment = .center
		label.sizeToFit()

		var labelFrame: CGRect = label.frame
		labelFrame.size.height += 0.4 * fontSize
		labelFrame.size.width = (count <= 1) ? labelFrame.size.height : labelFrame.size.width + fontSize // Adjust frame to be circle for single character or elliptical for more than 1 characters
		label.frame = labelFrame
		label.clipsToBounds = true
		label.layer.cornerRadius = labelFrame.size.height / 2

		frame = CGRect(x: 0, y: 0, width: label.frame.width + padding, height: label.frame.height)
		addSubview(label)
	}

	convenience init(count: Int, badgeColor: UIColor, position: BadgePosition = .default, textColor: UIColor = UIColor.white, padding: CGFloat = 1) {
		self.init(text: String(count), badgeColor: badgeColor, position: position, textColor: textColor, padding: padding)
	}

	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		updatePosition()
	}

	func updatePosition() {
		guard let frame = superview?.frame else { return }
		switch position {
		case .topRightCorner: self.center = CGPoint(x: frame.width, y: 0)
		case .topLeftCorner: self.center = CGPoint(x: 0, y: 0)
		case .bottomRightCorner: self.center = CGPoint(x: frame.height, y: frame.width)
		case .bottomLeftCorner: self.center = CGPoint(x: 0, y: frame.height)
		default: break
		}
	}

	/// Position of badge
	///
	/// - topRightCorner: badge will be in top right corner of superview
	/// - topLeftCorner: badge will be in top left corner of superview
	/// - bottomRightCorner: badge will be in bottom right corner of superview
	/// - bottomLeftCorner: badge will be in bottom left corner of superview
	/// - `default`: in this case badge won't have position, example is when `BadgeView` is in `UITextField.rightView`
	enum BadgePosition {
		case topRightCorner
		case topLeftCorner
		case bottomRightCorner
		case bottomLeftCorner
		case `default`
	}
}
