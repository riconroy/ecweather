//
//  RCFlowLayout.swift
//  weather
//
//  Created by rick conroy on 2015-03-02.
//  Copyright (c) 2015 rick conroy. All rights reserved.
//

import UIKit

class RCFlowLayout : UICollectionViewFlowLayout {
	
	override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
		let attributesArray = super.layoutAttributesForElementsInRect(rect) as [UICollectionViewLayoutAttributes]
		return attributesArray.map {
			theLayoutAttributes in
			if theLayoutAttributes.representedElementKind == nil {
				let theIndexPath = theLayoutAttributes.indexPath
				theLayoutAttributes.frame = self.layoutAttributesForItemAtIndexPath(theIndexPath).frame
			}
			return theLayoutAttributes
		}
	}
	
	func setLayoutVariables(screenWidth: Int) {
		// do some math, based on the width of the screen
		let marginSize = 10
		let cellSize = screenWidth - marginSize * 2
		
		self.itemSize = CGSize(width: cellSize, height: cellSize)
		self.minimumLineSpacing = CGFloat (marginSize)
		self.sectionInset = UIEdgeInsets(top: CGFloat (marginSize * 2),
			left: CGFloat (marginSize), bottom: CGFloat (marginSize * 2), right: CGFloat (marginSize))
	}
	
	// bump the second item in the row down a bit
	override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
		let theAttributes = super.layoutAttributesForItemAtIndexPath(indexPath)
		return theAttributes
	}
	
}
