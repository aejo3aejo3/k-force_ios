//
//  NotificationCell.swift
//  k-force_ios
//
//  Created by John on 2018/5/8.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {


    var btV2 : UIButton!
    
    let screenWidth = GlobalVariable.screenWidth
    let screenHeight = GlobalVariable.screenHeight
    let kforceBlack = UIColor(netHex: 0x404040)
    
    let textLeftMargin = GlobalVariable.screenWidth * 0.1583
    
    @IBOutlet var titleLabel: UILabel!{
        didSet{
            titleLabel.text = "通知標題"
            titleLabel.textColor = kforceBlack
            titleLabel.frame = CGRect(x: textLeftMargin, y: screenHeight * 0.0088, width: 200, height: 20)
            
        }
    }
    @IBOutlet var msgLabel: UILabel!{
        didSet{
            msgLabel.text = "內文內文內文內文內文"
            msgLabel.textColor = kforceBlack
            msgLabel.frame = CGRect(x: textLeftMargin, y: 0, width: 200, height: 20)
//            msgLabel.center.y = self.center.y
            msgLabel.translatesAutoresizingMaskIntoConstraints = false
            msgLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
            msgLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: textLeftMargin).isActive = true
        }
    }
    @IBOutlet var timeLabel: UILabel!{
        didSet{
            timeLabel.text = "今天 17 : 14"
            timeLabel.textColor = UIColor(red: 107, green: 107, blue: 107)
            timeLabel.frame = CGRect(x: screenWidth * 0.743, y: screenHeight * 0.0088, width: 100, height: 20)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        let iconSize = screenWidth * 0.0972
        let cellHeight = screenHeight * 0.1188
        let btYpostition = (cellHeight - iconSize) / 2
        print("btYpostition : \(btYpostition)")
        
        btV2 = UIButton(frame: CGRect(x: screenWidth * 0.02916, y: btYpostition, width: iconSize, height: iconSize))
        btV2.setImage(UIImage(named: "notice_pe_white"), for: .normal)
        // 設定icon跟button view padding
        btV2.imageEdgeInsets = UIEdgeInsets(top: 7.5, left: 7.5, bottom: 7.5, right: 7.5)
        btV2.backgroundColor = UIColor(netHex: 0x9293b5)
        // 將button設定為圓型
        btV2.layer.cornerRadius = btV2.bounds.size.width * 0.5
        btV2.layer.masksToBounds = true
        
        
        addSubview(btV2)



    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        //TODO 按了cell之後跳到內頁
        if selected {
            print("notificatin cell was clicked")
            
        }
        
    }
 
  
}
