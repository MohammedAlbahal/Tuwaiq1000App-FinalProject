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
        buttonSingIn.setTitleColor(UIColor(named: "color-1"), for: .normal)
        buttonSingIn.backgroundColor = UIColor(named: "Color-2 ")
        buttonSingIn.translatesAutoresizingMaskIntoConstraints = false
        buttonSingIn.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        buttonSingIn.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
        return buttonSingIn
    }()
    
    @objc private func singInButtonTapped(sender: UIButton!) {
        let alert = UIAlertController( title: NSLocalizedString("l", comment: ""),
                                      message: "",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("z", comment: ""),  style: .default, handler: {
            action in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "RegisterVC")
            vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
            print("Yes start Chat")}))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("x", comment: ""), style: .default, handler: {
            action in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vcc = storyboard.instantiateViewController(withIdentifier: "RegisterInstroctorVC")
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
        logInBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 127).isActive = true
        logInBtn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 65).isActive = true
        logInBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logInBtn.widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
    func loadSideBarViewFunctionalityy(){
        logInBtn.setTitle(NSLocalizedString("c", comment: ""), for: .normal)
        logInBtn.layer.cornerRadius = 10
        logInBtn.clipsToBounds = true
        logInBtn.backgroundColor = UIColor(named: "Color")
        logInBtn.titleLabel?.textColor = UIColor(named: "color-1")
        logInBtn.titleLabel?.tintColor = UIColor(named: "color-1")
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
        cell.layer.cornerRadius = 30
        cell.clipsToBounds = true
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
        logInBtn.backgroundColor = UIColor(named: "Color")
        picC.delegate = self
        picC.dataSource = self
        picC.layer.masksToBounds = true
        picC.layer.cornerRadius = 30
        
    }
    
}
