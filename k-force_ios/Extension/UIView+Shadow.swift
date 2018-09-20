//
//  UIView+Shadow.swift
//  k-force_ios
//
//  Created by John on 2018/5/11.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit

extension UIView{
    func setShadow(){
        //        cell.layer.shadowOffset = CGSize(width:25, height: 25)
        //        cell.layer.shadowOpacity = 0.8
        //        cell.layer.shadowRadius = 15
        //        cell.layer.shadowColor = UIColor.red.cgColor
        //        cell.layer.masksToBounds = false
        
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 15
        self.layer.shadowOffset = CGSize(width: 6, height: 6)
        self.layer.masksToBounds = false
    }
}
