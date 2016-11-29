//
//  VillainCollectionViewController.swift
//  BondVillains
//
//  Created by Mukul Sharma on 10/15/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit

private let reuseIdentifier = "VillainCollectionViewCell"

class VillainCollectionViewController: UICollectionViewController {

	@IBOutlet weak var layout: UICollectionViewFlowLayout!
	
	// Get ahold of some villains, for the table
	// This is an array of Villain instances
	let allVillains = Villain.allVillains
	
    override func viewDidLoad() {
        super.viewDidLoad()

		let space: CGFloat = 3.0
		let dimension = (view.frame.size.width - (2 * space)) / 3.0
		
		layout.minimumLineSpacing = space
		layout.minimumInteritemSpacing = space
		layout.itemSize = CGSizeMake(dimension, dimension)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allVillains.count
    }
	
	override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! VillainCollectionViewCell
		
		let villain = allVillains[indexPath.row]
		cell.imageView.image = UIImage(named: villain.imageName)
		cell.label.text = villain.name
		
		return cell
	}

	override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath) {
		
		let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("VillainDetailViewController") as! VillainDetailViewController
		detailController.villain = self.allVillains[indexPath.row]
		self.navigationController!.pushViewController(detailController, animated: true)
	}

}
