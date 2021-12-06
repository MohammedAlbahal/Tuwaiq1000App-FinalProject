////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////
import UIKit
class ProductsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchResultsUpdating, UISearchBarDelegate{
    
    var search = false
    var searchedProductes = [Product]()
    var searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    @IBOutlet weak var collectionFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuresearchController()
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (3 * space)) / 3.0

        collectionFlowLayout.minimumInteritemSpacing = 0
        collectionFlowLayout.minimumLineSpacing = space
        collectionFlowLayout.itemSize = CGSize(width: dimension, height: dimension)
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }
                                         
//     func numberOfSections(in collectionView: UICollectionView) -> Int {
//         return categoris.count
//     }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if search{
            return searchedProductes.count
        }else{
            return products.count
        }
       
    }


                                         
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! productCollectionViewCell
        if search{
            cell.procductImage.image = searchedProductes[indexPath.row].productPic
            cell.productName.text = searchedProductes[indexPath.row].prodauctName
            cell.productPriceLabel.text = ":\(searchedProductes[indexPath.row].prodauctPrice)"
        }else{
            cell.productName.text = products[indexPath.row].prodauctName
            cell.procductImage.image =  products[indexPath.row].productPic
            cell.productPriceLabel.text = ":\(products[indexPath.row].prodauctPrice)"
        }
        
        
        return cell
    }
    


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = products[indexPath.row]
        performSegue(withIdentifier: "product_info", sender: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "product_info"{
         return
        }
        let productInfo = segue.destination as! ProductInfo
        productInfo.product = sender as? Product
    }

    
    private func configuresearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Student By Name"
        searchController.searchBar.barTintColor = .gray
        searchController.searchBar.barTintColor = .white
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            
            search = true
            searchedProductes.removeAll()
            for i in products{
                if i.prodauctName.lowercased().contains(searchText.lowercased()){
                    searchedProductes.append(i)
                }
            }
        }else{
           
            search = false
            searchedProductes.removeAll()
            searchedProductes = products
        }
        
        productCollectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search = false
        searchedProductes.removeAll()
        productCollectionView.reloadData()
    }
}
