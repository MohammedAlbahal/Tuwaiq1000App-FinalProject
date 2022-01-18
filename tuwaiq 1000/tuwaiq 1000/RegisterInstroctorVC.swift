//
//  RegisterInstroctorVC.swift
//  tuwaiq 1000
//
//  Created by saja Al-qhtani on 30/05/1443 AH.
//RegisterInstroctorVC

import UIKit
import GoogleSignIn
import Firebase

class RegisterInstroctorVC: UIViewController {
    var searchba: Array<Item> = List
    let db =  Firestore.firestore()
    
    let subTitLbl: UILabel = {
        let title = UILabel()
        title.text = "Tuwaiq 1000"
        title.textColor = .label
        title.font = UIFont.systemFont(ofSize: 15, weight: .light)
        title.backgroundColor = UIColor(named: "Color-2")
        title.layer.cornerRadius = 12
        title.layer.masksToBounds = true
        title.textAlignment = .center
        title.numberOfLines = 0
        return title
    }()
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue with Google", for: .normal)
        button.titleLabel?.font = UIFont(name: "Chalkboard SE", size: 20)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(named: "Color-2")
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "Color")
        setupBtn()
        setupLbl()
    }
    
    private func setupBtn() {
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        button.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        
        
        
    }
    
    private func setupLbl() {
        
        subTitLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subTitLbl)
        subTitLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 750).isActive = true
        subTitLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subTitLbl.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        guard let currentUser = Auth.auth().currentUser else {return}
        db.collection("Users").document(currentUser.displayName!).setData([
            "isOnline": "no",
        ], merge: true) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("ChangedUserStatus")
            }
        }
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
 
        guard let currentUser = Auth.auth().currentUser else {return}
        db.collection("Users").document(currentUser.displayName!).setData([
            "isOnline": "no",
        ], merge: true) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("ChangedUserStatus")
            }
        }
   
        
    }

    @objc private func signInButtonPressed() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { results, error in
                if error != nil {
                    print(error?.localizedDescription as Any)
                    return
                }
                
                guard let res = results else {return}

                guard let userFullName = res.user.displayName else {return}
                self.db.collection("Users").document(userFullName).setData([
                    "full name": userFullName,
                    "uuid": UUID().uuidString,
                    "isOnline": "yes"
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                        self.performSegue(withIdentifier: "123456", sender:nil)
                    }
                }
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
