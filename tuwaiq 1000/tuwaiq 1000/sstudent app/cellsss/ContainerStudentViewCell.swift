//
//  ContainerStudentViewCell.swift
//  MidiOS
//
//  Created by Bel Cerezo on 4/2/21.
//

import UIKit

class ContainerStudentViewCell: UITableViewCell{
//   MARK: - IBOutlets
    @IBOutlet weak var collectionStudentView: UICollectionView!
    private var students: [Student] = []
    
    override func prepareForReuse() {
        super.prepareForReuse()
        students = []
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionStudentView.delegate = self
        collectionStudentView.dataSource = self
    }
    
   func configure(students:[Student]){
        self.students = students
        collectionStudentView.reloadData()
    }

}

extension ContainerStudentViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return students.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130,
                      height: 142)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectMemberItemViewCell", for: indexPath) as? SubjectMemberItemViewCell
        
        cell?.configure(image: UIImage(named: students[indexPath.row].photo ),
                        subject: students[indexPath.row].name )
        
        return cell ?? UICollectionViewCell()
        
    }
    
}
