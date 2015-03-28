//
//  Summary.swift
//  weather
//
//  Created by rick conroy on 2015-03-02.
//  Copyright (c) 2015 rick conroy. All rights reserved.
//

import UIKit

class Summary: UICollectionViewCell {
	
	var temperature: UILabel?
	
	override init (frame theRect: CGRect) {
		super.init(frame: theRect)
	}

	required init(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let tempRect = CGRectMake(50, 50, 250, 90)
		temperature = UILabel(frame: tempRect)
		temperature?.font = UIFont (name: "HelveticaNeue-UltraLight", size: 96)
		temperature?.text = "-17"
		temperature?.textColor = UIColor.whiteColor()
		
		contentView.addSubview(temperature!)
	}
	
}
