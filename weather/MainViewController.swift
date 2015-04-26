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
		let bgImage = UIImage(named: "imageTest1")
		bgImageView = UIImageView(image: bgImage!)
		bgImageView?.contentMode = .Top
		// bgImageView!.frame = view.frame
		view.addSubview(bgImageView!)
		
		
		// create the same image on top, but blurred
		// let blurredImage = bgImage!.applyBlurWithRadius(30.0, tintColor: UIColor(white: 0.8, alpha: 0.73), saturationDeltaFactor: 1.8, maskImage: bgImage)
		// let blurredImage = bgImage!.applyLightEffect()
		let reducedImage = resizeImageToNonRetina(bgImage!)
		let blurredImage = applyBlurEffectToImage(reducedImage)
		println("\(bgImage)")
		println("\(reducedImage)")
		println("\(blurredImage)")
		
		bgBlurImageView = UIImageView(image: blurredImage)
		bgBlurImageView?.contentMode = .Top
		// bgBlurImageView!.frame = view.frame
		view.addSubview(bgBlurImageView!)
		
		// hide it
		bgBlurImageView!.alpha = 0.0
		
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
		// how far has the scroll been scrolled
		var offsetY = scrollView.contentOffset.y
		
		// how far do we want the user to scroll to have full blur?
		let maxOffset:CGFloat = scrollView.frame.size.height - 100.0
		let scrollBlur = min(maxOffset, max(0.0, offsetY))
		
		// make that into a number [0, 1], and adjust the alpha of the (top) blurred image accordingly
		let thePercent = scrollBlur / maxOffset
		bgBlurImageView!.alpha = thePercent
		
		// how far up do we want the background image to rise?
		let maxRise:CGFloat = 30.0
		let riseRatio: CGFloat = 15.0
		
		// make that into an amount to rise the background image
		let scrollBgMove = min((maxRise * riseRatio), max(0.0, offsetY))
		let newFrame = CGRectOffset(view.frame, 0, -(scrollBgMove / riseRatio))
		bgBlurImageView?.frame = newFrame
		bgImageView?.frame = newFrame
	}
	
	/* image manipulation routines */
	
	func resizeImageToNonRetina (original:UIImage) -> UIImage {
		let newSize = CGSizeMake(view.frame.size.width, view.frame.size.height + 30.0)
		UIGraphicsBeginImageContextWithOptions(newSize, true, 1.0)
		original.drawInRect(CGRectMake(0, 0, view.frame.size.width, view.frame.size.height + 30.0))
		let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return resizedImage
	}
	
	// second version of the blur routine
	func applyBlurEffectToImage (original: UIImage) -> UIImage {
		let imageToBlur = CIImage(image: original)
		
		let blurfilter = CIFilter(name: "CIGaussianBlur")
		blurfilter.setValue(imageToBlur, forKey: kCIInputImageKey)
		blurfilter.setValue(5.0, forKey: kCIInputRadiusKey)
		
		// get a full rect, including the hidden bits
		let fullRect = CGRectMake(0, 0, imageToBlur.extent().width, imageToBlur.extent().height) //  + 30.0)
		
		let context = CIContext(options:[kCIContextUseSoftwareRenderer : true])
		let cgimg = context.createCGImage(blurfilter.outputImage, fromRect: fullRect) // imageToBlur.extent())
		let blurredImage = UIImage(CGImage: cgimg)
		
		// if we wanted to daisy chain filters:
		// raywenderlich.com/76285/beginning-core-image-swift
		
		return blurredImage!
	}
	
	/* this is the old version
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
			cell.alpha = 0.3
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



