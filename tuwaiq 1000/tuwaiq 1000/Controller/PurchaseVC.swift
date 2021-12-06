////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////
import UIKit

class PurchaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
	@IBOutlet weak var purchaseTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		purchaseTableView.delegate = self
		purchaseTableView.dataSource = self
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if cartArray.count > 0 {
			return cartArray.count
		}else{
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "purchase_cell", for: indexPath) as! PurchaseCell
		let data =  cartArray[indexPath.row]
		
		cell.purImageView.image = data.cartProdImage
		cell.purNameLable.text = data.cartProdName
		cell.purPriceLabel.text = data.cartProdPrice
		
		return cell
	}
	
   
	
}
