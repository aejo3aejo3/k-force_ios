//
//  UIViewController+HideKeyboard.swift
//  k-force_ios
//
//  Created by John on 2018/5/11.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit

extension UIView {
    
    func hideKeyboardTapOutside(){
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIView.dissmissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    @objc func dissmissKeyboard(){
        self.endEditing(true)
    }

}
