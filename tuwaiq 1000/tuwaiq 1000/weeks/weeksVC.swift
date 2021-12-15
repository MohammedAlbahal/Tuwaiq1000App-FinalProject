//
//  CourtVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 28/11/2021.
//

import UIKit

class CourtVC: UIViewController {
  
  
  private var collectionView: UICollectionView?
  //--------------------------------------------------------------------------
  override func viewDidLoad(){
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")

    collectionView = UICollectionView(frame: .zero,
                                      collectionViewLayout: layout)
//    collectionView?.backgroundColor = UIColor (named: "myBackgroundColor")
    guard let collectionView = collectionView else {
      return
    }
    navigationController?.navigationBar.backgroundColor = UIColor (named: "myBackgroundColor")
    collectionView.register(CourtVC_Cell.self, forCellWithReuseIdentifier: CourtVC_Cell.identifier)
    collectionView.dataSource = self
    collectionView.delegate = self
    view.addSubview(collectionView)
    collectionView.frame = view.bounds
  }
  //--------------------------------------------------------------------------
  var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 1
    layout.sectionInset = UIEdgeInsets(top: 20,left: 10,bottom: 100,right: 10)
    layout.itemSize = CGSize(width: 180, height: 220)
    return layout
  }()
}
//--------------------------------------------------------------------------
extension CourtVC: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) ->Int {
    
    return data_Court_str.count
  }
  //--------------------------------------------------------------------------
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
    
    let list = data_Court_str[indexPath.row]
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourtVC_Cell.identifier, for: indexPath) as! CourtVC_Cell
    cell.configure(label: "Custem\(indexPath.row)")
    cell.myImageView.image = list.image
    cell.name.text = list.name
    
    return cell
  }
  //--------------------------------------------------------------------------
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let data1 = data_Court_str[indexPath.row]
    
    let VC1_CourtPageVC = CourtPageVC()
    VC1_CourtPageVC.imageCourtPage.image = data1.image
    VC1_CourtPageVC.nameCourtPage.text = data1.name
    VC1_CourtPageVC.restFromVC = data1
    
    navigationController?.pushViewController(VC1_CourtPageVC, animated: true)
  }
}
//--------------------------------------------------------------------------
