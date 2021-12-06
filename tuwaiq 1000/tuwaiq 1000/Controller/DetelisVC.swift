////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////
import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var revenuLabel: UILabel!
	@IBOutlet weak var proftLabel: UILabel!
	@IBOutlet weak var outOfStockTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		outOfStockTableView.delegate = self
		outOfStockTableView.dataSource = self
		renevu()
		totalProfit()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if outStock.count > 0 {
			return outStock.count
		}else {
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "out_of_stock", for: indexPath) as! DetailsCell
		let data = outStock[indexPath.row]
		
		cell.outOfStockImage.image = data.image
		cell.outOfStockLabel.text = data.name
		cell.soldTimes.text = "\(mostSoldOut[data.name] ?? 0 ) Sold"
		
		return cell
	}
	
	func renevu(){
		for i in products {
			revenu.append(i.prodauctPrice)
		}
		let result = revenu.reduce(0, +)
		revenuLabel.text = " : \(result)"
	}

	func totalProfit(){
		for i in products{
			let profitResult = Double(i.productQuantity) * i.prodauctPrice
			profit.append(profitResult)
		}
		let total = profit.reduce(0, +)
		proftLabel.text = " : \(total)"
	}
	
}
