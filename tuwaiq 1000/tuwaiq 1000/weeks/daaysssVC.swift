//  tuwaiq 1000
//
//  Created by M.Al-qhtani on 07/05/1443 AH.
//

import UIKit

class CourtPageVC: UIViewController {
  
  var restFromVC: Court_str?
  //--------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
    all()
  }
  //--------------------------------------------------------------------------
  lazy var TV: UITableView = {
    let TV = UITableView()
    TV.translatesAutoresizingMaskIntoConstraints = false
    TV.rowHeight = 80
    TV.dataSource = self
    TV.delegate = self
    TV.register(Service_Cell.self, forCellReuseIdentifier: Service_Cell.identifier)
    return TV
  }()
  //--------------------------------------------------------------------------
  lazy var imageCourtPage: UIImageView = {
    let imageCourtPage = UIImageView()
    imageCourtPage.translatesAutoresizingMaskIntoConstraints = false
    return imageCourtPage
  }()
  //--------------------------------------------------------------------------
  lazy var nameCourtPage: UILabel = {
    let nameCourtPage = UILabel()
    nameCourtPage.translatesAutoresizingMaskIntoConstraints = false
    return nameCourtPage
  }()
  //--------------------------------------------------------------------------
  func all(){
    
    view.addSubview(TV)
    NSLayoutConstraint.activate([
      TV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      TV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      TV.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      TV.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
    ])
  }
}
//--------------------------------------------------------------------------
extension CourtPageVC: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return restFromVC?.a.count ?? 0
  }
  //--------------------------------------------------------------------------
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let list = restFromVC!.a[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: Service_Cell.identifier, for: indexPath) as! Service_Cell
    
    cell.imageCell.image = list.imageA
    cell.nameCell.text = list.nameA
    
    return cell
  }
  //--------------------------------------------------------------------------
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.reloadData()
    
    let data2 = restFromVC!.a[indexPath.row]

    let VC2_ServicePageVC = ServicePageVC()
    VC2_ServicePageVC.imageServicePage.image = data2.imageA
    VC2_ServicePageVC.nameServicePage.text = data2.nameA
    VC2_ServicePageVC.textServicePage.text = data2.summaryA
    VC2_ServicePageVC.restFromVC2 = data2

    navigationController?.pushViewController(VC2_ServicePageVC, animated: true)
  }
}
//--------------------------------------------------------------------------
