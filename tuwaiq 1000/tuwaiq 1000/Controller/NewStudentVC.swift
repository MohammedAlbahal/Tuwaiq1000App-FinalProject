////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////
import UIKit

class NewProductViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	@IBOutlet weak var newProductName: UITextField!
	@IBOutlet weak var newProductPrice: UITextField!
	@IBOutlet weak var newProductSummery: UITextField!
	@IBOutlet weak var newProductQuantity: UITextField!
	@IBOutlet weak var newProductSpecs: UITextField!
	@IBOutlet weak var newProductImage: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		newProductName.delegate = self
		newProductPrice.delegate = self
		newProductSummery.delegate = self
		newProductQuantity.delegate = self
		newProductSpecs.delegate = self
	}

	@IBAction func uploadPressed(_ sender: Any) {
		
		let image = UIImagePickerController()
		image.allowsEditing = true
		image.delegate = self
	
		present(image, animated: true)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage
		newProductImage.image = image
		dismiss(animated: true)
	}
	
	@IBAction func addPressed(_ sender: Any) {
		let newProduct = Product(prodauctName: newProductName.text ?? "",
								 productPic: newProductImage.image ?? .none,
								 prodauctPrice: Double(newProductPrice.text!) ?? 0.0,
								 productSummary: newProductSummery.text ?? "",
								 productQuantity: Int(newProductQuantity.text!) ?? 0,
								 productSpecs: newProductSpecs.text ?? "")
		products.append(newProduct)
		
		newProductName.placeholder = ""
		newProductPrice.placeholder = ""
		newProductSummery.placeholder = ""
		newProductQuantity.placeholder = ""
		newProductSpecs.placeholder = ""
		newProductImage.image = .none
		dismiss(animated: true)
	}
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		newProductName.resignFirstResponder()
		newProductPrice.resignFirstResponder()
		newProductSummery.resignFirstResponder()
		newProductQuantity.resignFirstResponder()
		newProductSpecs.resignFirstResponder()
		return true
	}
}
