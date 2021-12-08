//
//  ContainerViewCell.swift
//  MidiOS
//
//  Created by Bel Cerezo on 4/2/21.
//

import UIKit

class ContainerViewCell: UITableViewCell{
//   MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var teachers: [Teacher] = []
    
    override func prepareForReuse() {
        super.prepareForReuse()
        teachers = []
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configure(teachers:[Teacher]){
            self.teachers = teachers
            collectionView.reloadData()
        }
}

extension ContainerViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teachers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130,
                      height: 142)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectMemberItemViewCell", for: indexPath) as? SubjectMemberItemViewCell
        
        cell?.configure(image: UIImage(named: teachers[indexPath.row].photo ),
                        subject: teachers[indexPath.row].name )
        
        return cell ?? UICollectionViewCell()
        
    }
    
}



