//
//  SubjectViewController.swift
//  MidiOS
//
//  Created by Bel Cerezo on 3/2/21.
//

import UIKit

class SubjectViewController: UIViewController{
    
    //   MARK: - IBOutlets
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - IBActions
    @IBAction func onSavePressed(_ sender: UIButton){
        print("onSavePressed")
    }
    
    //    MARK: - Lifecycle functions
    override func viewDidLoad(){
        super.viewDidLoad()
        
        tittleLabel.text = "Subjects"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destination = segue.destination as? SubjectDescriptionViewController,
              let cell = sender as? UICollectionViewCell,
              let indexPath = collectionView.indexPath(for: cell) else {
            return
        }
        if (indexPath.row < defaultSubjects.count){
            destination.subject = defaultSubjects[indexPath.row]
            // 5.- Asignamos en el destination la variable creada 'delegate'
            destination.delegate = self
        }
    }
}

// 4.- Crear una extension de SubjectsViewController para conformar el protocolo creado en SubjectViewController
// e implementamos los métodos del protocolo

extension SubjectViewController: DeleteSubject {
    func deleteSubject(subject: Subject?) {
        defaultSubjects.removeAll {$0.name == subject?.name}
        collectionView.reloadData()
    }
}

extension SubjectViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return defaultSubjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 167,
                      height: 177)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectItemViewCell", for: indexPath) as? SubjectItemViewCell
        
        if(indexPath.row < defaultSubjects.count){
            let subject = defaultSubjects[indexPath.row]
            cell?.configure(image: UIImage(named: subject.photo),
                            subject: subject.name,
                            year: "10")
            
        }
        
        return cell ?? UICollectionViewCell()
    }
    
    
}

