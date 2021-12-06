////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////

import UIKit

class RecCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	@IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let space:CGFloat = 3.0
		let dimension = (view.frame.size.width - (2 * space)) / 5.0

		flowLayout.minimumInteritemSpacing = space
		flowLayout.minimumLineSpacing = space
		flowLayout.itemSize = CGSize(width: dimension, height: dimension)
		collectionView.delegate = self
		collectionView.dataSource = self
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if cartArray.count > 0 {
			return cartArray.count
		}else{
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rec", for: indexPath) as! RecCell
		let data = cartArray[indexPath.row]

		cell.recImage.image = data.cartProdImage
		cell.recLabel.text = data.cartProdName
		
		return cell
	}
}
