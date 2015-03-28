//
//  MainViewController.swift
//  weather
//
//  Created by rick conroy on 2015-02-27.
//  Copyright (c) 2015 rick conroy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
	
	var collectionView: UICollectionView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// place a test background
		let bgImage = UIImage(named: "torontoTest1.png")
		let bgImageView = UIImageView(image: bgImage!)
		bgImageView.frame = view.frame
		view.addSubview(bgImageView)
		
		// math for laying out the grid
		// println("width of screen = \(self.view.frame.size.width)")
		
		let myLayout = RCFlowLayout()
		myLayout.setLayoutVariables(Int(self.view.frame.size.width))
		
		collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: myLayout)
		
		collectionView!.dataSource = self
		collectionView!.delegate = self
		
		// collectionView!.registerClass(RCCell.self, forCellWithReuseIdentifier: "Cell")
		collectionView!.registerClass(Summary.self, forCellWithReuseIdentifier: "SummaryCell")
		collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "OtherCell")
		collectionView!.backgroundColor = UIColor.clearColor() // UIColor.blueColor()
		self.view.addSubview(collectionView!)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

// MARK: - Data Source

extension MainViewController: UICollectionViewDataSource {
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 9
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		var cell: UICollectionViewCell!
		
		if (indexPath.item == 0) {
			cell = collectionView.dequeueReusableCellWithReuseIdentifier("SummaryCell", forIndexPath: indexPath) as Summary
			cell.backgroundColor = UIColor.clearColor()
		} else {
			cell = collectionView.dequeueReusableCellWithReuseIdentifier("OtherCell", forIndexPath: indexPath) as UICollectionViewCell
			cell.backgroundColor = UIColor.blackColor()
			cell.alpha = 0.5
		}
		return cell
	}
}

// MARK: - Delegate

extension MainViewController: UICollectionViewDelegateFlowLayout {
	// when item tapped
	func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
		println("index number = \(indexPath.item)")
	}
}



