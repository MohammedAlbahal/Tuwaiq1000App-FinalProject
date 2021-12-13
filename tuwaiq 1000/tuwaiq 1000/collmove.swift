////import UIKit
////import Firebase
////class ProductVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//////  var sProducts: Array<Product> = products
////   var data = [UIImage (named: "A")!,
////         UIImage (named: "B")!,
////         UIImage (named: "C")!,
////         UIImage (named: "44")!,
////         UIImage (named: "F")!,
////         UIImage (named: "6")!,
////  ]
////  var timer :Timer?
////  var currentCellIndex = 0
////  @IBOutlet weak var pageControl: UIPageControl!
////  @IBOutlet weak var ImgCV: UICollectionView!
////  @IBOutlet weak var collectionC: UICollectionView!
////  func startTimer() {
////    timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
////  }
////  @objc func moveToNextIndex(){
////    if currentCellIndex < data.count - 1{
////      currentCellIndex += 1
////    }else{
////      currentCellIndex = 0
////    }
////    ImgCV.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
////    pageControl.currentPage = currentCellIndex
////  }
////  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////    if (collectionView == ImgCV) {
////      return data.count
////    }
////    return products.count
////  }
////  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////    let cell = ImgCV.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductCell
////    cell.ProductPhoto.image = data[indexPath.row]
////    if (collectionView == collectionC){
////      let cell2 = collectionC.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! ProductsCell
////      let product = products[indexPath.row]
////      cell2.setup(product: product)
////      cell2.imagecell.image = products[indexPath.row].logo
////      cell2.namecell.text = products[indexPath.row].name
////      cell2.discell.text = products[indexPath.row].dis
////      cell2.pricecell.text = products[indexPath.row].price
////      return cell2
////    }
////    return cell
////  }
////  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////    return CGSize (width: ImgCV.frame.width, height: ImgCV.frame.height)
////  }
////  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////    if (collectionView == ImgCV) {
////      return 0
////    }
////    return 0
////  }
////  override func viewDidLoad() {
////    super.viewDidLoad()
////    ImgCV.delegate = self
////    ImgCV.dataSource = self
////    collectionC.delegate = self
////    collectionC.dataSource = self
////    startTimer()
////    pageControl.numberOfPages = data.count
////  }
//
////}
//
//
//
////
////  Models.swift
////  RodeenaWater
////
////  Created by Sara M on 18/04/1443 AH.
////
//
//import UIKit
//
//
//struct User {
//    let id : String
//    let email : String
//    let password : String
//}
//struct Product {
//    let name : String?
//    let price : String?
//    let dis : String?
//    let logo: UIImage?
//}
//
//
//var cart: Array<Product> = []
//
//var products = [
//    Product (
//        name: "رودينا 200مل",
//        price: "13 SR",
//        dis: "كرتون - 48 عبوة بلاستيك",
//        logo: UIImage(named: "200")),
//
//    Product (
//        name: "رودينا 330مل",
//        price: "13.5 SR",
//        dis: "كرتون - 40 عبوة بلاستيك",
//        logo: UIImage (named: "330")),
//    Product (
//        name: "رودينا 600مل",
//        price: "14 SR",
//        dis: "كرتون - 30 عبوة بلاستيك",
//        logo: UIImage (named: "600")),
//]
//
