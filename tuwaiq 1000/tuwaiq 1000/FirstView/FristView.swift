//
//  VC1.swift
//  amazon
//
//  Created by Macbook on 11/03/1443 AH.
//

import UIKit

class FristView: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    lazy var logInBtn: UIButton = {
        let buttonSingIn = UIButton(type: .system)
        buttonSingIn.setTitle(NSLocalizedString("singOut", comment: ""), for: .normal)
        buttonSingIn.setTitleColor(.red, for: .normal)
        buttonSingIn.translatesAutoresizingMaskIntoConstraints = false
        buttonSingIn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        buttonSingIn.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
        return buttonSingIn
    }()
  
    @objc private func singInButtonTapped(sender: UIButton!) {
        let alert = UIAlertController(title: "Sign Out",
                                      message: "Are you sure you want to sign out",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            let vc = RegisterVC()
                     vc.modalPresentationStyle = .fullScreen
                     self.navigationController?.pushViewController(vc, animated: true)
                     print("Yes start Chat")}))
         
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: {
            action in
            let vcc = RegisterInstroctorVC()
            vcc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vcc, animated: true)
            print("Yes start Chat")}))
        
        self.present(alert, animated: true)
        
    }

    func setupButtonForSignIn() {
        view.addSubview(logInBtn)
    
    logInBtn.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
    }
    func setUpBottomViewConstraintss(){
        logInBtn.translatesAutoresizingMaskIntoConstraints = false
        logInBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 135).isActive = true
        logInBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 90).isActive = true
        logInBtn.heightAnchor.constraint(equalToConstant: 70).isActive = true
        logInBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    func loadSideBarViewFunctionalityy(){
    logInBtn.setTitle("Log Out", for: .normal)
    logInBtn.backgroundColor = UIColor(named: "Color-2")
    logInBtn.titleLabel?.textColor = UIColor(named: "Color-1")
    logInBtn.titleLabel?.tintColor = UIColor(named: "Color-1")
    logInBtn.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 20)
    logInBtn.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(logInBtn)
    }
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
        loadSideBarViewFunctionalityy()
        setUpBottomViewConstraintss()
        setupButtonForSignIn()
        logInBtn.backgroundColor = .black
        picC.delegate = self
        picC.dataSource = self

    }
   
}
