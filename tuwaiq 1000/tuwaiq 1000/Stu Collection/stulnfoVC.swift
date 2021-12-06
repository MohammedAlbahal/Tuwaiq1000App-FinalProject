////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////

import UIKit


class ProductInfo: UIViewController {
	
	var product: Product?
	
	@IBOutlet weak var productimage: UIImageView!
	@IBOutlet weak var productName: UILabel!
	@IBOutlet weak var productPrice: UILabel!
	@IBOutlet weak var productCategory: UILabel!
	@IBOutlet weak var productSummery: UILabel!
	@IBOutlet weak var productQuantity: UILabel!
	@IBOutlet var addToCartButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		productimage.image = product!.productPic
		productName.text = product!.prodauctName
		productPrice.text = "Evalution: \(product!.prodauctPrice)"
		productQuantity.text = "Level: \(product!.productQuantity)"
		productCategory.text = product!.productSpecs
		productSummery.text = product!.productSummary
	
		if product!.productQuantity == 0 {
			addToCartButton.isEnabled = false }
	}
	
	func outOfStuckCheck(){
		product!.productQuantity -= 1
		if product!.productQuantity == 0 {
			let new = OutOfStock(image: product!.productPic, name: product!.prodauctName)
			outStock.insert(new, at: 0)
		}
		
		
	}
	
	func mostSoldOutProduct(){
		let base = mostSoldOut[product!.prodauctName] ?? 0
		mostSoldOut[product!.prodauctName] = base + 1
	}
	
	@IBAction func addToCartPressed(_ sender: Any) {
		let saveProName = product!.prodauctName
		let savedProPic =  product!.productPic
		let savedProPrice = "Rate \(product!.prodauctPrice)"
		let itemInCart = Cart(cartProdImage: savedProPic, cartProdName: saveProName, cartProdPrice: savedProPrice)
		cartArray.insert(itemInCart, at: 0)
		outOfStuckCheck()
		mostSoldOutProduct()
	}
}
