//
//  UITextField+BorderStyle.swift
//  k-force_ios
//
//  Created by John on 2018/5/11.
//  Copyright © 2018年 k-force team. All rights reserved.
//

/*
 * 自訂會員設定頁面下方底線樣式
 */


import UIKit
extension UITextField {
    func setAccountSettingBorder(){
        let border = CALayer()
        let width = CGFloat(2.0)
        self.borderStyle = .none
        
        border.borderColor = UIColor(netHex: 0xcccccc).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
