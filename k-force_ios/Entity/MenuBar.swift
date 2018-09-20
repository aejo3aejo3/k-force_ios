//
//  MenuBar.swift
//  k-force_ios
//
//  Created by John on 2018/5/14.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit
class MenuBar: UIView {
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewLayout()
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 50 , height: 50), collectionViewLayout: layout)
        cv.backgroundColor = UIColor.blue

        return cv
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
