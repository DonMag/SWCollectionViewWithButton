//
//  MyTestCollectionViewCell.swift
//  SWCollectionViewWithButton
//
//  Created by Don Mag on 4/14/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

class MyTestCollectionViewCell: UICollectionViewCell, CellEditable {
	
	func deleteElement() {
		// do something
	}
	
	func tappedMe() -> Void {
		
		self.startBeingAfraid()
		
		if let rm = self.removeButton {
			rm.addTarget(self, action: #selector(self.innerTap), for: .touchUpInside)
		}
		
	}
	
	func innerTap() {
		
		print("inner tap")
		
		self.stopBeingAfraid()
	
	}
	
}
