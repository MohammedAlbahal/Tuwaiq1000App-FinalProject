////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////

import UIKit

class CartTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

	@IBOutlet weak var checkoutButton: UIButton!
	@IBOutlet weak var cartTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		cartTableView.delegate = self
		cartTableView.dataSource = self
		
		if cartArray.isEmpty{
			checkoutButton.isEnabled = false
		}
		
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if cartArray.count > 0 {
			return cartArray.count
		}else{
			return 0
		}
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
		let data = cartArray[indexPath.row]
		
		cell.cartProductNameLabel.text = data.cartProdName
		cell.cartProductPriceLabel.text = data.cartProdPrice
		cell.cartProductImage.image = data.cartProdImage
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			cartArray.remove(at: indexPath.row)
			self.cartTableView.deleteRows(at: [indexPath], with: .fade)
		}
		cartTableView.reloadData()
	}
	
   
	
	@IBAction func checkOutPressed(_ sender: Any) {
	
	}
}
