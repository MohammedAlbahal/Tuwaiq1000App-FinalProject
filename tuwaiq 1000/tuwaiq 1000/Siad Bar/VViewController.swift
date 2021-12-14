//
//  ViewController.swift
//  SideBarViewYT
//
//  Created by Vinayak Balaji Tuptewar on 10/08/20.
//  Copyright © 2020 Vinayak Balaji Tuptewar. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
let db = Firestore.firestore()
class VViewController: UIViewController {
    
    var sideBarView: UIView!
    var tableView = UITableView()
    var toplabel = UILabel()
    var bottomView = UIView()
    //let switchMood = UISwitch(frame:CGRect(x: 180, y: 150, width: 15, height: 0))
    //    var logOutBtn = UIButton()
    lazy var logOutBtn: UIButton = {
        let buttonSingOut = UIButton(type: .system)
        buttonSingOut.setTitle(NSLocalizedString("singOut", comment: ""), for: .normal)
        buttonSingOut.setTitleColor(.red, for: .normal)
        buttonSingOut.translatesAutoresizingMaskIntoConstraints = false
        buttonSingOut.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        buttonSingOut.addTarget(self, action: #selector(singOutButtonTapped), for: .touchUpInside)
        return buttonSingOut
    }()
    var nameLbl = UILabel()
    var imageview = UIImageView()
    var topHeight_navigationBar_statusBar:CGFloat = 0.0
    var isEnableSideBarView:Bool = false
    
    var arrData = ["Subject", "Instructors","Studens","Top 10 student","Exercises","Calculate your rate","References","Location","setting"]
    var arrImages:[UIImage] = [#imageLiteral(resourceName: "square.and.pencil"),#imageLiteral(resourceName: "person.wave.2"),#imageLiteral(resourceName: "person.3"),#imageLiteral(resourceName: "figure.wave"),#imageLiteral(resourceName: "square.and.pencil"),#imageLiteral(resourceName: "keyboard.onehanded.right"),#imageLiteral(resourceName: "globe.badge.chevron.backward"),#imageLiteral(resourceName: "location"),#imageLiteral(resourceName: "gear.circle-1")]
    
    
    var swipeToRight = UISwipeGestureRecognizer()
    var swipetoLeft = UISwipeGestureRecognizer()
    var tempview = UIView()
    var tapGesture = UITapGestureRecognizer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewFunctionality()
        loadSideBarViewFunctionality()
        loadGesturefunctionality()
        setupButtonForSignOut()
      //  setupMoodSwitch()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchCurrentUsers()
        checkIfUserDidntSignout()
    }
    @objc private func singOutButtonTapped(sender: UIButton!) {
        let alert = UIAlertController(title: "هل تريد تسجيل الخروج؟",
                                      message: "",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            self.dismiss(animated: true) {
                self.navigationController?.popViewController(animated: true)
            }
            
         }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel))
        self.present(alert, animated: true)
    }
    
    private func checkIfUserDidntSignout() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let navigationController = UINavigationController(rootViewController: RegisterVC())
            navigationController.modalPresentationStyle = .overFullScreen
            present(navigationController, animated: true)
            
            print("no user is signed in")
        }
        
    }
    
    func loadViewFunctionality(){
        var menuBtn = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .done, target: self, action: #selector(menuBtnClick))
        menuBtn.tintColor = UIColor(named: "Color-2")
        self.navigationItem.leftBarButtonItem = menuBtn
    }
    func setupButtonForSignOut() {
        bottomView.addSubview(logOutBtn)
        
        
        logOutBtn.addTarget(self, action: #selector(singOutButtonTapped), for: .touchUpInside)
        //        self.dismiss(animated: true, completion: nil)
    }
    
    func loadSideBarViewFunctionality(){
        topHeight_navigationBar_statusBar = UIApplication.shared.statusBarFrame.height + (navigationController?.navigationBar.frame.height)!
        
        tempview = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        tempview.backgroundColor = UIColor(named: "colorClaro")
        tempview.alpha = 0
        tempview.layer.cornerRadius = 27
        tempview.clipsToBounds = true
        sideBarView = UIView(frame: CGRect(x: -self.view.bounds.width/1.5, y: topHeight_navigationBar_statusBar, width: self.view.bounds.width/1.5, height: self.view.bounds.height - topHeight_navigationBar_statusBar))
        sideBarView.backgroundColor = UIColor(named: "Color")
        sideBarView.layer.cornerRadius = 15
        sideBarView.clipsToBounds = true
        tableView.backgroundColor = UIColor(named: "Color")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SideBarTableViewCell", bundle: nil), forCellReuseIdentifier: "sideBarCell")
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.layer.cornerRadius = 27
        tableView.clipsToBounds = true
        
        toplabel.text = "Tuwaiq 1000"
        toplabel.textAlignment = .center
        toplabel.font = UIFont(name: "Party LET", size: 45)
        toplabel.textColor = UIColor(named: "Color-1")
        toplabel.backgroundColor = UIColor(named: "Color-2")
        bottomView.backgroundColor = UIColor(named: "Color-2")
        
        logOutBtn.setTitle("Log Out", for: .normal)
        logOutBtn.backgroundColor = UIColor(named: "Color-2")
        logOutBtn.titleLabel?.textColor = UIColor(named: "Color-1")
        logOutBtn.titleLabel?.tintColor = UIColor(named: "Color-1")
        logOutBtn.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 20)
        logOutBtn.addTarget(self, action: #selector(singOutButtonTapped), for: .touchUpInside)
        
        
        nameLbl.numberOfLines = 0
        nameLbl.text = "Vinayak"
        nameLbl.textColor = UIColor(named: "Color-1")
        nameLbl.tintColor = UIColor(named: "Color-1")
        nameLbl.textAlignment = NSTextAlignment.center
        nameLbl.backgroundColor = UIColor(named: "Color-2")
        
        // UIColor(cgColor: CGColor(srgbRed: 239/255, green: 109/255, blue: 73/255, alpha: 1))
        
        if let userPhotoUrl = Auth.auth().currentUser?.photoURL {
            imageview.load(url: userPhotoUrl)
        }
        
        self.imageview.clipsToBounds = true
        self.imageview.layer.borderWidth = 1
        self.imageview.layer.borderColor = UIColor.white.cgColor
        
        self.view.addSubview(tempview)
        self.view.addSubview(sideBarView)
        self.sideBarView.addSubview(toplabel)
        self.sideBarView.addSubview(bottomView)
        self.sideBarView.addSubview(tableView)
        self.bottomView.addSubview(nameLbl)
        self.bottomView.addSubview(logOutBtn)
        self.bottomView.addSubview(imageview)
        
        setUpSideBarViewConstraints()
        setUpBottomViewConstraints()
    }
   
    //
    //
    ////        target: self,
    ////    action: #selector(signOutButtonTapped)
    //    }
    ////
    //        guard let currentUser = Auth.auth().currentUser else {return}
    //        db.collection("Users").document(currentUser.displayName!).setData([
    //            "isOnline": "no",
    //        ], merge: true) { err in
    //            if let err = err {
    //                print("Error writing document: \(err)")
    //            } else {
    //                try? Auth.auth().signOut()
    //                self.tabBarController?.selectedIndex = 0
    //                print("ChangedUserStatus")
    //            }
    //        }
    
//    func setupMoodSwitch(){
//
//        switchMood.addTarget(self, action: #selector(switchStateDidChange), for: .valueChanged)
//        view.addSubview(switchMood)
//        switchMood.onTintColor = ThemeColor.mainColor
//        switch gloabalWindow?.traitCollection.userInterfaceStyle {
//        case .dark:
//            switchMood.setOn(true, animated: false)
//        case .light:
//            switchMood.setOn(false, animated: false)
//        default:
//            print("Unspecified")
//        }
//    }
//    
//    @objc func switchStateDidChange() {
//        gloabalWindow?.overrideUserInterfaceStyle = switchMood.isOn ? .dark : .light
//    }
    func loadGesturefunctionality(){
        swipeToRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedToRight))
        swipeToRight.direction = .right
        self.view.addGestureRecognizer(swipeToRight)
        
        swipetoLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedToLeft))
        swipetoLeft.direction = .left
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeSideBarView))
        tempview.addGestureRecognizer(tapGesture)
    }
    
    
    func setUpBottomViewConstraints(){
        logOutBtn.translatesAutoresizingMaskIntoConstraints = false
        logOutBtn.leadingAnchor.constraint(equalTo: self.bottomView.leadingAnchor, constant: 20).isActive = true
        logOutBtn.topAnchor.constraint(equalTo: self.bottomView.topAnchor, constant: 15).isActive = true
        logOutBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.leadingAnchor.constraint(equalTo: self.bottomView.leadingAnchor, constant: 20).isActive = true
        nameLbl.bottomAnchor.constraint(equalTo: self.bottomView.bottomAnchor, constant: -15).isActive = true
        nameLbl.topAnchor.constraint(equalTo: self.logOutBtn.bottomAnchor, constant: 0).isActive = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.topAnchor.constraint(equalTo: self.bottomView.topAnchor, constant: 20).isActive = true
        imageview.trailingAnchor.constraint(equalTo: self.bottomView.trailingAnchor, constant: -20).isActive = true
        imageview.bottomAnchor.constraint(equalTo: self.bottomView.bottomAnchor, constant: -20).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    func setUpSideBarViewConstraints(){
        toplabel.translatesAutoresizingMaskIntoConstraints = false
        toplabel.leadingAnchor.constraint(equalTo: self.sideBarView.leadingAnchor, constant: 0).isActive = true
        toplabel.trailingAnchor.constraint(equalTo: self.sideBarView.trailingAnchor, constant: 0).isActive = true
        toplabel.topAnchor.constraint(equalTo: self.sideBarView.topAnchor, constant: 0).isActive = true
        toplabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.sideBarView.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.sideBarView.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: self.toplabel.bottomAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomView.topAnchor, constant: 0).isActive = true
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.leadingAnchor.constraint(equalTo: self.sideBarView.leadingAnchor, constant: 0).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: self.sideBarView.trailingAnchor, constant: 0).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: self.sideBarView.bottomAnchor, constant: 0).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    
    @objc func closeSideBarView(){
        print("tapGesture")
        self.view.addGestureRecognizer(swipeToRight)
        self.view.removeGestureRecognizer(swipetoLeft)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.sideBarView.frame = CGRect(x: -self.view.bounds.width/1.5, y: self.topHeight_navigationBar_statusBar, width: self.view.bounds.width/1.5, height: self.view.bounds.height - self.topHeight_navigationBar_statusBar)
            
            for alpha in (0...5).reversed(){
                self.tempview.alpha = CGFloat(alpha/10)
            }
        }, completion: nil)
        isEnableSideBarView = false
    }
    
    
    @objc func swipedToLeft(){
        self.view.addGestureRecognizer(swipeToRight)
        self.view.removeGestureRecognizer(swipetoLeft)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.sideBarView.frame = CGRect(x: -self.view.bounds.width/1.5, y: self.topHeight_navigationBar_statusBar, width: self.view.bounds.width/1.5, height: self.view.bounds.height - self.topHeight_navigationBar_statusBar)
            
            for alpha in (0...5).reversed(){
                self.tempview.alpha = CGFloat(alpha/10)
            }
            
        }, completion: nil)
        isEnableSideBarView = false
    }
    
    
    @objc func swipedToRight(){
        self.imageview.layer.cornerRadius = self.imageview.frame.size.height/2
        
        self.view.addGestureRecognizer(swipetoLeft)
        self.view.removeGestureRecognizer(swipeToRight)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.sideBarView.frame = CGRect(x: 0, y: self.topHeight_navigationBar_statusBar, width: self.view.bounds.width/1.5, height: self.view.bounds.height - self.topHeight_navigationBar_statusBar)
            
            for alpha in (0...5){
                self.tempview.alpha = CGFloat(alpha/10)
            }
            self.tempview.alpha = 0.5
        }, completion: nil)
        isEnableSideBarView = true
    }
    
    
    @objc func menuBtnClick(){
        self.imageview.layer.cornerRadius = self.imageview.frame.size.height/2
        
        if isEnableSideBarView{
            self.view.addGestureRecognizer(swipeToRight)
            self.view.removeGestureRecognizer(swipetoLeft)
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
                self.sideBarView.frame = CGRect(x: -self.view.bounds.width/1.5, y: self.topHeight_navigationBar_statusBar, width: self.view.bounds.width/1.5, height: self.view.bounds.height - self.topHeight_navigationBar_statusBar)
                
                for alpha in (0...5).reversed(){
                    self.tempview.alpha = CGFloat(alpha/10)
                }
                
            }, completion: nil)
            
            isEnableSideBarView = false
            
        }else{
            self.view.addGestureRecognizer(swipetoLeft)
            self.view.removeGestureRecognizer(swipeToRight)
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                self.sideBarView.frame = CGRect(x: 0, y: self.topHeight_navigationBar_statusBar, width: self.view.bounds.width/1.5, height: self.view.bounds.height - self.topHeight_navigationBar_statusBar)
                
                for alpha in (0...5){
                    self.tempview.alpha = CGFloat(alpha/10)
                }
                self.tempview.alpha = 0.5
            }, completion: nil)
            
            isEnableSideBarView = true
        }
    }
    
}




extension VViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideBarCell", for: indexPath)as! SideBarTableViewCell
        cell.imagev.image = self.arrImages[indexPath.row]
        cell.lbl.text = self.arrData[indexPath.row]
        //        if(indexPath.row % 2 == 0){
        //            cell.backgroundColor = .black
        //            } else{
        //                cell.backgroundColor = .red
        //            }
        //        cell.imagev.backgroundColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
        //        cell.lbl.backgroundColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
        cell.lbl.tintColor = UIColor(named: "Color-1")
        cell.imagev.tintColor = UIColor(named: "Color-1")
        cell.contentView.backgroundColor = UIColor(named: "Color")
//        cell.contentView.lbl. = .black
        cell.lbl.textColor = UIColor(named: "Color-1")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let cell = tableView.cellForRow(at: indexPath)as! SideBarTableViewCell
//
        
        switch indexPath.row {
        case 8:
            let stteing = self.storyboard?.instantiateViewController(identifier: "lll")as!SettingViewController
            self.navigationController?.pushViewController(stteing, animated: true)
            //            cell.imagev.tintColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
            //            cell.lbl.textColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
            //            cell.contentView.backgroundColor = UIColor.black
            
        case 7:
            let mapVC = self.storyboard?.instantiateViewController(identifier: "dvc")as!MapVC
            self.navigationController?.pushViewController(mapVC, animated: true)
            //            cell.imagev.tintColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
            //            cell.lbl.textColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
            //            cell.contentView.backgroundColor = UIColor.black
            
        case 2:
            let studentVC = self.storyboard?.instantiateViewController(identifier: "svc")as! StudentViewController
            self.navigationController?.pushViewController(studentVC, animated: true)
            //            cell.imagev.tintColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
            //            cell.lbl.textColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
            //            cell.contentView.backgroundColor = UIColor.white
            // PurchaseViewController
        case 3:
            let tt = self.storyboard?.instantiateViewController(identifier: "hhh")as! PurchaseViewController
            self.navigationController?.pushViewController(tt, animated: true)
        case 6:
            let webVC = self.storyboard?.instantiateViewController(identifier: "ovc")as! WebVC
            self.navigationController?.pushViewController(webVC, animated: true)
            //            cell.imagev.tintColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
            //            cell.lbl.tintColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
            //            //            cell.lbl.setTitleColor(.black, for: .normal)
            //            cell.contentView.backgroundColor = UIColor.white
            //
//            cell.lbl.textColor = .black
            
        case 5:
            let GPAVC = self.storyboard?.instantiateViewController(identifier: "aaa")as! HomeViewController
            self.navigationController?.pushViewController(GPAVC, animated: true)
            //            cell.imagev.tintColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
            //            cell.lbl.textColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
            //            cell.contentView.backgroundColor = UIColor.white
//            cell.lbl.textColor = .black
            //
        case 0:
            let subjectVC = self.storyboard?.instantiateViewController(identifier: "bbb")as! SubjectViewController
            self.navigationController?.pushViewController(subjectVC, animated: true)
//            cell.imagev.tintColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
//            cell.lbl.textColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
//            cell.contentView.backgroundColor = UIColor.white
//            cell.lbl.textColor = .black
            
        case 1:
            let TeacherVC = self.storyboard?.instantiateViewController(identifier: "ccc")as! TeacherViewController
            self.navigationController?.pushViewController(TeacherVC, animated: true)
//            cell.imagev.tintColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
//            cell.lbl.textColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
//            cell.contentView.backgroundColor = UIColor.white
//            cell.lbl.textColor = .black
        case 4:
            let quizVC = self.storyboard?.instantiateViewController(identifier: "ggg")as! ViewController
            self.navigationController?.pushViewController(quizVC, animated: true)
////            cell.imagev.tintColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
////            cell.lbl.textColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
////            cell.contentView.backgroundColor = UIColor.white
////            cell.lbl.textColor = .black
//
        default:
            print(self.arrData[indexPath.row])
            cell.imagev.tintColor = UIColor(named: "Color-1")
            cell.lbl.textColor = UIColor(named: "Color-1")
            cell.contentView.backgroundColor = UIColor(named: "Color")
            
        }
    }
    
    //    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    //        let cell = tableView.cellForRow(at: indexPath)as! SideBarTableViewCell
    //        cell.imagev.tintColor = UIColor.white
    //        cell.lbl.textColor = UIColor.black
    //        cell.lbl.tintColor = .black
    //        cell.contentView.backgroundColor = UIColor(red: 0.90, green: 1.00, blue: 1.00, alpha: 1.00)
    //        tableView.reloadData()
    //    }
    
    
    private func fetchCurrentUsers() {
        guard let currentUserName = FirebaseAuth.Auth.auth().currentUser?.displayName else {return}
        db.collection("Users").whereField("full name", isEqualTo: currentUserName)
            .addSnapshotListener { (querySnapshot, error) in
                
                if let e = error {
                    print("There was an issue retrieving data from Firestore. \(e)")
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let userName = data["full name"] as? String,
                               let userIsOnline = data["isOnline"] as? String{
                                DispatchQueue.main.async {
                                    self.nameLbl.text = userName
                                    
                                }
                            }
                        }
                    }
                    
                }
            }
    }
}
