//
//  MainCell.swift
//  W00_assignmenet_2
//
//  Created by SWUCOMPUTER on 2017. 10. 11..
//  Copyright © 2017년 SWUCOMPUTER. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

  @IBOutlet weak var bankLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var accountLabel: UILabel!
  
  //출력을 위한 라벨 설정
    
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
