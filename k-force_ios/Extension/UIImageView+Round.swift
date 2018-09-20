//
//  UIImageView+Round.swift
//  k-force_ios
//
//  Created by John on 2018/5/7.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setRound(){
        self.layer.cornerRadius = (self.frame.width / 2)
//        self.layer.cornerRadius = 50.0
        self.layer.masksToBounds = true
    }
}
