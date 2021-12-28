//
//  VC1.swift
//  amazon
//
//  Created by Macbook on 11/03/1443 AH.
//

import UIKit

class FristView: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGSize = UIScreen.main.bounds.size

        if indexPath.row % 3 == 0 {
            return CGSize(width: screenSize.width, height: 200)
        } else {
            return CGSize(width: screenSize.width/2, height: 200)
        }
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    var searchba: Array<Iitem> = Liist
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchba.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestCell", for: indexPath
        ) as! CEll111
        
        let item = searchba[indexPath.row]
        cell.setup(Item: item)
        return cell
    }
    


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let prouduct = searchba[indexPath.row]
        performSegue(withIdentifier: "shsh", sender:prouduct
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier != "shsh" {
            return
        }
        let yy = segue.destination as! VC22
        yy.selectedpro = sender as? Iitem
    }

    
    @IBOutlet weak var picC: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchba = Liist
        picC.reloadData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        picC.delegate = self
        picC.dataSource = self
       
    }
   
}
