//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
let dbb = Firestore.firestore()
class SideBarInstroctorVC: UIViewController {
    
    var sideBarView: UIView!
    var tableView = UITableView()
    var toplabel = UILabel()
    var bottomView = UIView()
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
    
    var arrData = ["Subject", "Students","Edit Students","Top 10 Students","attendance","Note","Learning Resource","Location","Setting","rimm"]
    var arrImages:[UIImage] = [#imageLiteral(resourceName: "square.and.pencil"),#imageLiteral(resourceName: "person.wave.2"),#imageLiteral(resourceName: "person.3"),#imageLiteral(resourceName: "figure.wave"),#imageLiteral(resourceName: "square.and.pencil"),#imageLiteral(resourceName: "keyboard.onehanded.right"),#imageLiteral(resourceName: "globe.badge.chevron.backward"),#imageLiteral(resourceName: "location"),#imageLiteral(resourceName: "gear.circle-1"),#imageLiteral(resourceName: "gear.circle-1"),#imageLiteral(resourceName: "gear.circle-1")]
    
    
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
     
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchCurrentUsers()
        checkIfUserDidntSignout()
    }
    @objc private func singOutButtonTapped(sender: UIButton!) {
        let alert = UIAlertController(title: "Sign Out",
                                      message: "Are you sure you want to sign out",
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




extension SideBarInstroctorVC : UITableViewDelegate,UITableViewDataSource{
    
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
		case 9:
			let ggoo = self.storyboard?.instantiateViewController(identifier: "pop")as!AminVC
			self.navigationController?.pushViewController(ggoo, animated: true)
        case 8:
            let stteing = self.storyboard?.instantiateViewController(identifier: "kkk")as!SettingViewController
            self.navigationController?.pushViewController(stteing, animated: true)
        case 7:
            let mapVC = self.storyboard?.instantiateViewController(identifier: "dvc")as!MapVC
            self.navigationController?.pushViewController(mapVC, animated: true)
        case 2:
            let editstudent = self.storyboard?.instantiateViewController(identifier: "111")as!ManagerViewController
            self.navigationController?.pushViewController(editstudent, animated: true)
        case 3:
            let tt = self.storyboard?.instantiateViewController(identifier: "hhh")as! PurchaseViewController
            self.navigationController?.pushViewController(tt, animated: true)
        case 6:
            let tabVC = self.storyboard?.instantiateViewController(identifier: "666")as! TabbsVC
            self.navigationController?.pushViewController(tabVC, animated: true)
        case 5:
            let Not = self.storyboard?.instantiateViewController(identifier: "555")as! NoteVC
            self.navigationController?.pushViewController(Not, animated: true)
        case 0:
            let weeks = self.storyboard?.instantiateViewController(identifier: "444")as! CourtVC
            self.navigationController?.pushViewController(weeks, animated: true)
        case 1:
            let student = self.storyboard?.instantiateViewController(identifier: "222")as! ProductsCollectionViewController
            self.navigationController?.pushViewController(student, animated: true)
        case 4:
            let attendance = self.storyboard?.instantiateViewController(identifier: "333")as! TabbsVC
            self.navigationController?.pushViewController(attendance, animated: true)
            
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

