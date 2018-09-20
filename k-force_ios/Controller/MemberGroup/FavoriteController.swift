//
//  FavoriteController.swift
//  k-force_ios
//
//  Created by John on 2018/5/8.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit

class FavoriteController: UIViewController {

    let screenWidth = GlobalVariable.screenWidth
    let screenHeight = GlobalVariable.screenHeight
    
    let menuBar : MenuBar = {
        let mb = MenuBar()
        // 測試切換 branch merge
        return mb
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        setupMenuBar()
        
        
        
    }

    private func setupMenuBar(){
        let navibarHeight = self.navigationController?.navigationBar.frame.height
//        0.0616
        menuBar.frame = CGRect(x: 0, y: navibarHeight!, width: screenWidth, height: 90)
        menuBar.backgroundColor = UIColor(netHex: 0xf7f7f7)
        view.addSubview(menuBar)
        

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
