//  tuwaiq 1000
//
//  Created by M.Al-qhtani.

import UIKit

class Product {
	var prodauctName: String
	var productSummary: String
	var productPic: UIImage!
	var productSpecs: String
	var prodauctPrice: Double
	var productQuantity: Int
	
	init(prodauctName:String , productPic: UIImage!, prodauctPrice: Double, productSummary: String ,productQuantity: Int, productSpecs: String){
		self.prodauctName = prodauctName
		self.productSummary = productSummary
		self.productPic = productPic
		self.productSpecs = productSpecs
		self.prodauctPrice = prodauctPrice
		self.productQuantity = productQuantity
	}
}
class Category{
	var catName: String
	var catItems: Array<Product>
	
	init(catName: String, catItems: Array<Product>){
		self.catItems = catItems
		self.catName = catName
	}
}


var products = [
	Product(prodauctName: "Mohammed Albahal",
					   productPic: UIImage(named: "me"),
			prodauctPrice: 88.6,
					   productSummary: "Abha Swift",
					   productQuantity: 10,
					   productSpecs: "m.albahl.q@gmail.com"),
			   Product(prodauctName: "Ibrhaem Ahmed",
					   productPic: UIImage(named: "ww"),
					   prodauctPrice: 93,
					   productSummary: "Abha Swift",
					   productQuantity: 10,
					   productSpecs: "Ibrhaem@gmail.com"),
			   Product(prodauctName: "Abdulaziz Alshehri",
					   productPic: UIImage(named: "ee"),
					   prodauctPrice: 91.2,
					   productSummary: "Abha Swift",
					   productQuantity: 10,
					   productSpecs: "Abdulaziz@gmail.com"),
				Product(prodauctName: "Ahmed Assiri",
						productPic: UIImage(named: "rr"),
						prodauctPrice: 89,
						productSummary: "Abha Swift",
						productQuantity: 10,
						productSpecs: "Ahmed@gmail.com"),
				Product(prodauctName: "Fawaz Mohammed",
						productPic: UIImage(named: "tt"),
						prodauctPrice: 94.5,
						productSummary: "Abha Swift",
						productQuantity:10,
						productSpecs: "Fawaz@gmail.com"),
				Product(prodauctName: "Hassan Abdulaziz",
						productPic: UIImage(named: "qq"),
						prodauctPrice: 85,
						productSummary: "Abha Swift",
						productQuantity: 10,
						productSpecs: "Hassan@gmail.com"),
				Product(prodauctName: "Sara Mohammed",
						productPic: UIImage(named: "img_student_1"),
						prodauctPrice: 91.7,
						productSummary: "Abha Swift",
						productQuantity:10,
						productSpecs: "Sara@gmail.com"),
				Product(prodauctName: "Deema AlKamdi",
						productPic: UIImage(named:"img_student_4"),
						prodauctPrice: 90,
						productSummary: "Abha Swift",
						productQuantity: 10,
						productSpecs: "Deema@gmail.com"),
    Product(prodauctName: "Sara Saud",
            productPic: UIImage(named:"img_student_5"),
			prodauctPrice: 96.7,
            productSummary: "Abha Swift",
            productQuantity: 1,
            productSpecs: "Sara@gmail.com"),
    Product(prodauctName: "Tasneem Jafsher",
            productPic: UIImage(named:"img_student_4"),
            prodauctPrice: 95,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Tasneem@gmail.com"),
    
    Product(prodauctName: "Kholod Alabdulrhman",
            productPic: UIImage(named:"img_teacher_1"),
            prodauctPrice: 88,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Kholod@gmail.com"),
    
    Product(prodauctName: "Sana Alshahrani",
            productPic: UIImage(named:"img_student_4"),
            prodauctPrice: 89,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Sana@gmail.com"),
    
    Product(prodauctName: "Maram Alshahrani",
            productPic: UIImage(named:"img_teacher_1"),
            prodauctPrice: 88,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Maram@gmail.com"),
    
    Product(prodauctName: "Alanood",
            productPic: UIImage(named:"img_student_5"),
            prodauctPrice: 90,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Alanood@gmail.com"),
    Product(prodauctName: "Atheer Alzahrani",
            productPic: UIImage(named:"img_student_1"),
			prodauctPrice: 93.8,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Atheer@gmail.com"),
    
    Product(prodauctName: "Sara Alzahrani",
            productPic: UIImage(named:"img_student_4"),
			prodauctPrice: 92.9,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Sara@gmail.com"),
    
    Product(prodauctName: "Amal Alfaifi",
            productPic: UIImage(named:"img_teacher_1"),
            prodauctPrice:92,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Amal@gmail.com"),
    
    Product(prodauctName: "Hanan yhya",
            productPic: UIImage(named:"img_student_5"),
            prodauctPrice: 87,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Hanan@gmail.com"),
    
    Product(prodauctName: "Munirah",
            productPic: UIImage(named:"img_student_1"),
			prodauctPrice: 90.4,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Munirah@gmail.com"),
    
    Product(prodauctName: "Sally",
            productPic: UIImage(named:"img_student_4"),
			prodauctPrice: 85.8,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Sally@gmail.com"),
    
    Product(prodauctName: "Jawaher",
            productPic: UIImage(named:"img_teacher_1"),
			prodauctPrice: 90.4,
            productSummary: "Abha Swift",
            productQuantity: 1,
            productSpecs: "Jawaher@gmail.com"),
    
    Product(prodauctName: "Fatmih Mohammed",
            productPic: UIImage(named:"img_student_5"),
			prodauctPrice: 93.9,
            productSummary: "Abha Swift",
            productQuantity: 1,
            productSpecs: "Fatmih@gmail.com"),
    
    Product(prodauctName: "Hanan Assiri",
            productPic: UIImage(named:"img_student_1"),
			prodauctPrice: 88.6,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Hanan@gmail.com"),
    
    Product(prodauctName: "Afnan Assiri",
            productPic: UIImage(named:"img_teacher_1"),
            prodauctPrice: 90,
            productSummary: "Abha Swift",
            productQuantity: 10,
            productSpecs: "Afnan@gmail.com"),
    
	]


struct Cart {
	let cartProdImage: UIImage!
	let cartProdName: String
	let cartProdPrice: String
}

var cartArray = [Cart]()

struct OutOfStock {
	let image: UIImage!
	let name: String
}

var outStock = [OutOfStock]()

var mostSoldOut: [String : Int] = [:]

var revenu = [Double]()

var profit = [Double]()
