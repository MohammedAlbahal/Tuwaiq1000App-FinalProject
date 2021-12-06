////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////

import UIKit

class ManagerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
   
	@IBOutlet weak var updateCollectionView: UICollectionView!
	
	@IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let space:CGFloat = 3.0
		let dimension = (view.frame.size.width - (3 * space)) / 3.0

		flowLayout.minimumInteritemSpacing = space
		flowLayout.minimumLineSpacing = space
		flowLayout.itemSize = CGSize(width: dimension, height: 252)
		
		updateCollectionView.dataSource = self
		updateCollectionView.delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateCollectionView.reloadData()
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return products.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "manager_update", for: indexPath) as! ManagerCell
		let data = products[indexPath.row]
		
		cell.productImage.image = data.productPic
		cell.productName.text = data.prodauctName
		cell.productPrice.text = ":\(data.prodauctPrice)"
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let alert = UIAlertController(title: "Alert", message: "Do you want to Update or Delete this Student ?", preferredStyle: .alert )
		alert.addAction(UIAlertAction (title: "Update", style: .default, handler: { _ in

			self.performSegue(withIdentifier: "to_update", sender: indexPath)
			
		}))

		alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.default, handler: { _ in
					//Delete Action
			products.remove(at: indexPath.row)
			self.updateCollectionView.performBatchUpdates({
			self.updateCollectionView.deleteItems(at: [indexPath])})
			self.updateCollectionView.reloadData()
				}))

		self.present(alert, animated: true, completion: nil)

   }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier != "to_update"{
			return
		}
       // -----------------------------------------------------------------------
        let updateVC = segue.destination as! UpdateViewController
        updateVC.indexPath = sender as? IndexPath
	}
}
 

