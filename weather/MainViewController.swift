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
	var bgBlurImageView: UIImageView?
	var bgImageView: UIImageView?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// we start with an unblurred image
		let bgImage = UIImage(named: "torontoTest1.png")
		bgImageView = UIImageView(image: bgImage!)
		bgImageView!.frame = view.frame
		view.addSubview(bgImageView!)
		
		// create the same image on top, but blurred
		let blurredImage = bgImage!.applyBlurWithRadius(30.0, tintColor: UIColor(white: 0.8, alpha: 0.73), saturationDeltaFactor: 1.8, maskImage: bgImage)
		// let blurredImage = bgImage!.applyLightEffect()
		
		// create the same image on top, but blurred
		// let blurredImage = bgImage?.applyBlurWithRadius(15.0, tintColor: UIColor(white: 1.0, alpha: 0.2),
			// saturationDeltaFactor: 1.2, maskImage: bgImage)
		
		bgBlurImageView = UIImageView(image: blurredImage)
		bgBlurImageView!.frame = view.frame
		bgBlurImageView!.alpha = 0.0
		view.addSubview(bgBlurImageView!)
		
		// math for laying out the grid
		// println("width of screen = \(self.view.frame.size.width)")
		
		let myLayout = RCFlowLayout()
		myLayout.setLayoutVariables(Int(self.view.frame.size.width))
		
		collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: myLayout)
		collectionView!.dataSource = self
		collectionView!.delegate = self
		
		// each collection cell needs to be "registered"
		collectionView!.registerClass(Summary.self, forCellWithReuseIdentifier: "SummaryCell")
		collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "OtherCell")
		collectionView!.backgroundColor = UIColor.clearColor()
		self.view.addSubview(collectionView!)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func scrollViewDidScroll(scrollView: UIScrollView) {
		// println("scrolling = \(scrollView.contentOffset)")
		var offsetY = scrollView.contentOffset.y
		let maxOffset:CGFloat = 450.0
		offsetY = min(maxOffset, max(0.0, offsetY))
		// println("offsetY: \(offsetY)")
		let thePercent = offsetY / maxOffset
		// println("percent: \(thePercent)")
		bgBlurImageView!.alpha = thePercent
	}
	
	func applyBlurEffectToImage (original: UIImage) -> UIImage {
		UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0.0)
		var imgaa :UIImage = UIGraphicsGetImageFromCurrentImageContext();
		var ciimage :CIImage = CIImage(image: imgaa)
		
		var filter : CIFilter = CIFilter(name:"CIGaussianBlur")
		filter.setDefaults()
		filter.setValue(ciimage, forKey: kCIInputImageKey)
		filter.setValue(30, forKey: kCIInputRadiusKey)
		var outputImage : CIImage = filter.outputImage;
		var finalImage :UIImage = UIImage(CIImage: outputImage)!
		UIGraphicsEndImageContext()
		
		return finalImage
	}
	
	/*
	func applyBlurEffectToImage (original: UIImage) -> UIImage {
		var imageToBlur = CIImage(image: original)
		var blurfilter = CIFilter(name: "CIGaussianBlur")
		blurfilter.setValue(imageToBlur, forKey: "inputImage")
		var resultImage = blurfilter.valueForKey("outputImage") as CIImage
		var blurredImage = UIImage(CIImage: resultImage)
		return blurredImage!
	} */
}

// MARK: - Data Source

extension MainViewController: UICollectionViewDataSource {
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 9
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		var cell: UICollectionViewCell!
		
		if (indexPath.item == 0) {
			cell = collectionView.dequeueReusableCellWithReuseIdentifier("SummaryCell", forIndexPath: indexPath) as! Summary
			cell.backgroundColor = UIColor.clearColor()
		} else {
			cell = collectionView.dequeueReusableCellWithReuseIdentifier("OtherCell", forIndexPath: indexPath) as! UICollectionViewCell
			cell.backgroundColor = UIColor.blackColor()
			cell.alpha = 0.5
		}
		return cell
	}
}

// MARK: - Delegate

extension MainViewController: UICollectionViewDelegateFlowLayout {
	// when item tapped
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		println("index number = \(indexPath.item)")
	}
}



