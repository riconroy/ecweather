//
//  RCCell.swift
//  weather
//
//  Created by rick conroy on 2015-03-02.
//  Copyright (c) 2015 rick conroy. All rights reserved.
//

import UIKit

class RCCell: UICollectionViewCell {
	
	let textLabel: UILabel!
	let imageView: UIImageView!
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		// here's my attempt:
		let theImageSize = contentView.frame.size
		let imageRect = CGRect(origin: CGPoint(x: 0, y: 0), size: theImageSize)
		let myBezierPath = bezierPathWithPolygonInRect(imageRect, numberOfSides: 6)
		
		imageView = UIImageView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
		imageView.contentMode = UIViewContentMode.ScaleAspectFill
		
		var shapelayer = CAShapeLayer()
		shapelayer.path = myBezierPath.CGPath
		imageView.layer.mask = shapelayer
		
		contentView.addSubview(imageView)
		
		//		let textFrame = CGRectMake(0, imageView.frame.size.height, frame.size.width, frame.size.height / 3)
		//		textLabel = UILabel(frame: textFrame)
		//		textLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
		//		textLabel.textAlignment = .Center
		//		contentView.addSubview(textLabel)
	}
	
	func bezierPathWithPolygonInRect(rect: CGRect, numberOfSides: Int) -> UIBezierPath {
		if (numberOfSides < 3) {
			var e = NSException(name:"Exception", reason:"numberOfSides must be at least 3", userInfo:nil)
			e.raise()
		}
		
		let radius = min(CGRectGetWidth(rect), CGRectGetHeight(rect)) / 2
		let centreX = CGRectGetMidX(rect)
		let centreY = CGRectGetMidY(rect)
		
		var myBezier = UIBezierPath()
		myBezier.moveToPoint(CGPoint(x: centreX + radius, y: centreY + 0))
		
		for var i = 0; i < numberOfSides; i++ {
			let theta:Double = (2.0 * Double(i) * M_PI) / Double(numberOfSides)
			let xCoordinate = Float(centreX) + Float(radius) * cosf(Float(theta))
			let yCoordinate = Float(centreY) + Float(radius) * sinf(Float(theta))
			myBezier.addLineToPoint(CGPoint(x: CGFloat(xCoordinate), y: CGFloat(yCoordinate)))
		}
		myBezier.closePath()
		
		// add a white stroke (this causes the compiler to complain mightily)
		// UIColor.whiteColor().setStroke()
		// myBezier.stroke()
		
		return myBezier
	}
	
}
