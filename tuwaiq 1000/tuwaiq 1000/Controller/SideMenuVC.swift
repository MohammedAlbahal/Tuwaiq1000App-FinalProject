////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////
//import UIKit
//
//protocol MenuViewControllerDelegate: AnyObject {
//    func menuItemSelected(menuItem: MenuViewController.MenuOptions)
//}
//
//class MenuViewController: UIViewController {
//    
//    weak var delegate: MenuViewControllerDelegate?
//    
//    enum MenuOptions: String, CaseIterable {
//        case home = "Home"
//        case info = "Information"
//        case appRating = "App Rating"
//        case shareApp = "Share App"
//        case settings = "Settings"
//        
//        var imageName: String {
//            switch self {
//            case .home:
//                return "house"
//            case .info:
//                return "airplane"
//            case .appRating:
//                return "star"
//            case .shareApp:
//                return "message"
//            case .settings:
//                return "gear"
//            }
//        }
//    }
//    
//    private let tableView: UITableView = {
//        let table = UITableView()
//        table.backgroundColor = nil
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//    }()
//    
//    let greyColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1.0)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
//        view.backgroundColor = greyColor
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
//    }
//}
//
//extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return MenuOptions.allCases.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = greyColor
//        cell.contentView.backgroundColor = greyColor
//        cell.textLabel?.textColor = .white
//        cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
//        cell.imageView?.image = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
//        cell.imageView?.tintColor = .white
//        cell.selectionStyle = UITableViewCell.SelectionStyle.none;
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        let item = MenuOptions.allCases[indexPath.row]
//        delegate?.menuItemSelected(menuItem: item)
//    }
//
//}
