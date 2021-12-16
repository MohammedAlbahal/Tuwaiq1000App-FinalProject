//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//

import UIKit

class PersonInfoViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    private var personsSubjects = [DefaultData](){
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        personsSubjects = []
    }
    
    func configure(data: [DefaultData]) {
        personsSubjects = data
    }
    

}

extension PersonInfoViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        personsSubjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 130,
               height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonOrSubjectItemView",
                                                      for: indexPath) as? PersonOrSubjectItemView
        
        if(indexPath.row < personsSubjects.count) {
            cell?.configure(with: personsSubjects[indexPath.row])
        }
        
        return cell ?? UICollectionViewCell()
    }
}

