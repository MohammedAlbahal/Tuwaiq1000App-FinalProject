//  tuwaiq 1000
//
//  Created by M.Al-qhtani on 07/05/1443 AH.
//

import UIKit

class ServicePageVC : UIViewController{
  
  var restFromVC2: A?
  //--------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
   view.backgroundColor = UIColor(named: "Color-3")
    
    allConstraint()
  }
  //--------------------------------------------------------------------------
  lazy var imageServicePage: UIImageView = {
    let imageServicePage = UIImageView()
    imageServicePage.layer.masksToBounds = true
    imageServicePage.layer.cornerRadius = 10
    imageServicePage.translatesAutoresizingMaskIntoConstraints = false
    imageServicePage.backgroundColor = .systemGray4
    return imageServicePage
  }()
  //--------------------------------------------------------------------------
  lazy var nameServicePage: UILabel = {
    let nameServicePage = UILabel()
    nameServicePage.textAlignment = .center
    nameServicePage.backgroundColor = .systemGray4
    nameServicePage.textColor = .label
    nameServicePage.font = .systemFont(ofSize: 20)
    nameServicePage.layer.cornerRadius = 10
    nameServicePage.clipsToBounds = true
    nameServicePage.translatesAutoresizingMaskIntoConstraints = false
      nameServicePage.textAlignment = .center
    return nameServicePage
  }()
  //--------------------------------------------------------------------------
  lazy var stalyServicePage: UILabel = {
    let stalyServicePage = UILabel()
    stalyServicePage.font = UIFont.systemFont(ofSize: 18)
    stalyServicePage.backgroundColor = .systemGray4
    stalyServicePage.numberOfLines = 0
    stalyServicePage.textColor = .label
    stalyServicePage.translatesAutoresizingMaskIntoConstraints = false
    stalyServicePage.layer.cornerRadius = 10
    stalyServicePage.clipsToBounds = true
    stalyServicePage.textAlignment = .center
    return stalyServicePage
      
  }()
  //--------------------------------------------------------------------------
  lazy var textServicePage: UILabel = {
    let textServicePage = UILabel()
    textServicePage.backgroundColor = .systemGray4
    textServicePage.textColor = .label
    textServicePage.font = .systemFont(ofSize: 18)
    textServicePage.numberOfLines = 0
    textServicePage.textAlignment = .right
    textServicePage.translatesAutoresizingMaskIntoConstraints = false
    textServicePage.textAlignment = .center
    return textServicePage
  }()
  //--------------------------------------------------------------------------
  lazy var buttonServicePage: UIButton = {
    let buttonServicePage = UIButton()
    buttonServicePage.setTitle("Show more", for: .normal)
    buttonServicePage.setTitleColor(.label, for: .normal)
    buttonServicePage.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    buttonServicePage.layer.cornerRadius = 20
    buttonServicePage.clipsToBounds = true
    buttonServicePage.translatesAutoresizingMaskIntoConstraints = false
    buttonServicePage.backgroundColor = .systemGray4
    buttonServicePage.addTarget(self, action: #selector(popupAlert), for: .touchUpInside)
    self.view.addSubview(buttonServicePage)
    return buttonServicePage
  }()
  //--------------------------------------------------------------------------
  func allConstraint(){
    
    view.addSubview(imageServicePage)
    NSLayoutConstraint.activate([
      imageServicePage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      imageServicePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      imageServicePage.widthAnchor.constraint(equalToConstant: 100),
      imageServicePage.heightAnchor.constraint(equalToConstant: 100)
    ])
    //------------------------------------------------------------------------
    view.addSubview(nameServicePage)
    NSLayoutConstraint.activate([
      nameServicePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameServicePage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180),
      nameServicePage.widthAnchor.constraint(equalToConstant: 350),
      nameServicePage.heightAnchor.constraint(equalToConstant: 50)
    ])
    //------------------------------------------------------------------------
    view.addSubview(stalyServicePage)
    NSLayoutConstraint.activate([
      stalyServicePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stalyServicePage.topAnchor.constraint(equalTo: nameServicePage.bottomAnchor, constant: 10),
      stalyServicePage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
      stalyServicePage.widthAnchor.constraint(equalToConstant: 350),
      stalyServicePage.heightAnchor.constraint(equalToConstant: 410)
    ])
    //------------------------------------------------------------------------
    view.addSubview(textServicePage)
    NSLayoutConstraint.activate([
      textServicePage.widthAnchor.constraint(equalToConstant: 335),
      textServicePage.topAnchor.constraint(equalTo: nameServicePage.bottomAnchor, constant: 20),
      textServicePage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:30),
      textServicePage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
    ])
    //------------------------------------------------------------------------
    view.addSubview(buttonServicePage)
    NSLayoutConstraint.activate([
      buttonServicePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttonServicePage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
      buttonServicePage.widthAnchor.constraint(equalToConstant: 350),
      buttonServicePage.heightAnchor.constraint(equalToConstant: 70)
    ])
  }
  //--------------------------------------------------------------------------
  @objc func popupAlert(sender: UIButton!){
    
    let alert = UIAlertController(title: "Swift Documentaion",
                                  message: "",
                                  preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
      UIApplication.shared.open(URL(string: "https://www.swift.org/documentation/")! as URL, options: [:], completionHandler: nil)
      print("Yes, apply")}))
    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
      print("Do not apply")}))
    
    self.present(alert, animated: true)
  }
}
//--------------------------------------------------------------------------
