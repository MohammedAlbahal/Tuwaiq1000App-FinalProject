//  tuwaiq 1000
//
//  Created by M.Al-qhtani on 07/05/1443 AH.
//

import UIKit

class CourtVC_Cell: UICollectionViewCell {
  
  static let identifier = "CourtVC_Cell_key"
  
  //--------------------------------------------------------------------------
  let staly: UILabel = {
    let staly = UILabel()
    staly.textColor = .label
    staly.layer.cornerRadius = 40
    staly.clipsToBounds = true
    staly.backgroundColor = .systemGray4
    return staly
  }()
  //--------------------------------------------------------------------------
  let myImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.tintColor = .label
    imageView.backgroundColor = .systemGray4
    return imageView
  }()
  //--------------------------------------------------------------------------
  let name: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.numberOfLines = 0
    label.textAlignment = .center
    label.backgroundColor = .systemGray4
    return label
  }()
  //--------------------------------------------------------------------------
  override init (frame: CGRect) {
    super.init(frame: frame)
    
    contentView.addSubview(staly)
    contentView.addSubview(myImageView)
    contentView.addSubview(name)
    contentView.clipsToBounds = true
  }
  //--------------------------------------------------------------------------
  required init?(coder: NSCoder) {
    fatalError( "init(coder:) has not been implemented")
  }
  //--------------------------------------------------------------------------
  override func layoutSubviews() {
    super.layoutSubviews()
    
    staly.frame = CGRect(x: 0,
                         y: 0,
                         width: contentView.frame.size.height-40,
                         height: contentView.frame.size.height-0)
    
    myImageView.frame = CGRect(x: 10,
                               y: 15,
                               width: 160,
                               height: 140)
    
    name.frame = CGRect(x: 10,
                        y: 160,
                        width: 160,
                        height: 45)
  }
  //--------------------------------------------------------------------------
  public func configure(label: String) {
    name.text = label
  }
  //--------------------------------------------------------------------------
  override func prepareForReuse() {
    super.prepareForReuse()
    name.text = nil
  }
}
//--------------------------------------------------------------------------
