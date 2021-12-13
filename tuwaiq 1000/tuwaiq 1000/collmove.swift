//
//  SettingViewController.swift
//  Fit Tip App
//
//  Created by Atheer Othman on 21/04/1443 AH.
//

import UIKit
import FirebaseAuth

class SettingViewController: UIViewController {
    
    
    let switchMood = UISwitch(frame:CGRect(x: 180, y: 150, width: 15, height: 0))
    let signOutButton = UIButton(type: .system)
    let darkImageView = UIImageView()
    let lightImageView = UIImageView()
    let languageButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        navigationItem.title = NSLocalizedString("setting", comment: "")
        setupMoodSwitch()
        setupSignOut()
        setupDarkLightImageView()
        setupLanguageButton()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    
    func setupMoodSwitch(){
       
        switchMood.addTarget(self, action: #selector(switchStateDidChange), for: .valueChanged)
        view.addSubview(switchMood)
        switchMood.onTintColor = ThemeColor.mainColor
        switch gloabalWindow?.traitCollection.userInterfaceStyle {
        case .dark:
            switchMood.setOn(true, animated: false)
        case .light:
            switchMood.setOn(false, animated: false)
        default:
            print("Unspecified")
        }
    }
    
    @objc func switchStateDidChange() {
        gloabalWindow?.overrideUserInterfaceStyle = switchMood.isOn ? .dark : .light
    }
    
    func setupSignOut(){
//        view.addSubview(signOutButton)
//        signOutButton.translatesAutoresizingMaskIntoConstraints = false
//        signOutButton.setTitle(NSLocalizedString("signout", comment: ""), for: .normal)
//        signOutButton.addTarget(self, action: #selector(signOutButtonPressed), for: .touchUpInside)
//        signOutButton.tintColor = UIColor(named: "BackgroundColor")
//        signOutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        signOutButton.layer.cornerRadius = 10
//        signOutButton.layer.masksToBounds = true
        
        let gradient = setupRedGradientLayer()
        gradient.frame = view.bounds
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        signOutButton.layer.insertSublayer(gradient, at: 0)
        
        
        let constraint = [
            signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.heightAnchor.constraint(equalToConstant: 50),
            signOutButton.widthAnchor.constraint(equalToConstant: view.frame.width-90)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
//
//    @objc func signOutButtonPressed(){
//        let alert = UIAlertController(title: NSLocalizedString("signout", comment: ""), message: NSLocalizedString("signoutMessage", comment: "") , preferredStyle: .alert)
//        let exitAction = UIAlertAction(title: NSLocalizedString("signout", comment: ""), style: .destructive) { (true) in
//            self.logout()
//        }
//        alert.addAction(UIAlertAction(title: NSLocalizedString("cancel", comment: "") , style: .default, handler: nil))
//        alert.addAction(exitAction)
//        present(alert, animated: true, completion: nil)
    
    
//    func logout(){
//        do{
//            try Auth.auth().signOut()
//            let controller = SignInViewController()
//            controller.modalPresentationStyle = .fullScreen
//            self.present(controller, animated: false, completion: nil)
//        } catch {
//            print(error)
//        }
//    }
    
    func setupDarkLightImageView(){
        view.addSubview(darkImageView)
        view.addSubview(lightImageView)
        
        darkImageView.translatesAutoresizingMaskIntoConstraints = false
        lightImageView.translatesAutoresizingMaskIntoConstraints = false
        
        darkImageView.image = UIImage(systemName: "moon.fill")
        lightImageView.image = UIImage(systemName: "sun.max.fill")
        
        darkImageView.tintColor = ThemeColor.secoundColor
        lightImageView.tintColor = UIColor(red:1.00, green:0.84, blue:0.17, alpha:1.00)
        let constraints = [
            darkImageView.bottomAnchor.constraint(equalTo: switchMood.bottomAnchor),
            darkImageView.leftAnchor.constraint(equalTo: switchMood.rightAnchor, constant: 16),
            darkImageView.heightAnchor.constraint(equalToConstant: 30),
            darkImageView.widthAnchor.constraint(equalToConstant: 30),
            
            lightImageView.bottomAnchor.constraint(equalTo: switchMood.bottomAnchor),
            lightImageView.rightAnchor.constraint(equalTo: switchMood.leftAnchor, constant: -16),
            lightImageView.heightAnchor.constraint(equalToConstant: 30),
            lightImageView.widthAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupLanguageButton(){
        view.addSubview(languageButton)
        languageButton.translatesAutoresizingMaskIntoConstraints = false
        languageButton.setTitle(NSLocalizedString("language", comment: "") , for: .normal)
        languageButton.addTarget(self, action: #selector(changeLanguagePressed), for: .touchUpInside)
        languageButton.tintColor = UIColor(named: "BackgroundColor")
        languageButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        languageButton.layer.cornerRadius = 10
        languageButton.layer.masksToBounds = true
        
        let gradient = setupGradientLayer()
        gradient.frame = view.bounds
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        languageButton.layer.insertSublayer(gradient, at: 0)
        let constraints = [
            languageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            languageButton.bottomAnchor.constraint(equalTo: signOutButton.topAnchor, constant: -16),
            languageButton.heightAnchor.constraint(equalToConstant: 50),
            languageButton.widthAnchor.constraint(equalToConstant: view.frame.width-90)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func changeLanguagePressed(){
        let currentLang = Locale.current.languageCode
        print("current Language: \(currentLang ?? "")")
        let newLanguage = currentLang == "en" ? "ar" : "en"
        UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
        exit(0)
    }
}


