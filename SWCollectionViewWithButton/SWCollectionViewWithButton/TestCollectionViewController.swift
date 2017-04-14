//
//  TestCollectionViewController.swift
//  SWCollectionViewWithButton
//
//  Created by Don Mag on 4/14/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

private let reuseIdentifier = "myCell"

class TestCollectionViewController: UICollectionViewController {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyTestCollectionViewCell
		cell.contentView.backgroundColor = .red
        return cell
    }
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		if let c = collectionView.cellForItem(at: indexPath) as? MyTestCollectionViewCell {
			print("selected a cell")
			c.tappedMe()
		}
		
	}
	
}
