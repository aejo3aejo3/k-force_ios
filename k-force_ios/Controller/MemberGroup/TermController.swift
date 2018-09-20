//
//  TermController.swift
//  k-force_ios
//
//  Created by John on 2018/5/8.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit

class TermController: UIViewController {

    
    let screenWidth = GlobalVariable.screenWidth
    let screenHeight = GlobalVariable.screenHeight
    
  
    var iconTerm: UIButton!
    @IBOutlet var contetnView : UIView!{
        didSet{
//            contetnView.backgroundColor = UIColor.orange
        
        }
    }
    @IBOutlet var titleLabel: UILabel!{
        didSet{
            titleLabel.frame = CGRect(x: screenWidth * 0.158, y: screenHeight * 0.049, width: 100, height: 30)
            titleLabel.sizeToFit()
        }
    }
    var termTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        let iconSize = screenWidth * 0.0972
        iconTerm = UIButton(frame: CGRect(x: screenWidth * 0.029, y: screenHeight * 0.04, width: iconSize, height: iconSize))
        iconTerm.setImage(UIImage(named: "flie_pe_white"), for: .normal)
        // 設定icon跟button view padding
        iconTerm.imageEdgeInsets = UIEdgeInsets(top: 7.5, left: 7.5, bottom: 7.5, right: 7.5)
        iconTerm.backgroundColor = UIColor(netHex: 0x9293b5)
        // 將button設定為圓型
        iconTerm.layer.cornerRadius = iconTerm.bounds.size.width * 0.5
        iconTerm.layer.masksToBounds = true
        contetnView.addSubview(iconTerm)

      
        let viewLayer = contetnView.layer
        viewLayer.borderColor = UIColor(netHex: 0xEEEEEE).cgColor
        viewLayer.borderWidth = 1.5
        viewLayer.cornerRadius = 4

        viewLayer.shadowOffset = CGSize(width: 2, height: 2)
        viewLayer.shadowOpacity = 0.3
        viewLayer.shadowRadius = 1
        viewLayer.shadowColor = UIColor.darkGray.cgColor
        viewLayer.masksToBounds = true
        
        
        
//        let tabbarHeight = self.tabBarController?.tabBar.frame.height
//        print("tabbarHeight : \(tabbarHeight)")
        
        
        contetnView.translatesAutoresizingMaskIntoConstraints = false
        contetnView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 120).isActive = true
        
        
        
        
        
        
        let sideMargin = (contetnView.frame.size.width - screenWidth * 0.868) / 2
        
        //            screenWidth * 0.029  left margin
        
        print("termTextView sideMargin :\(sideMargin)")
        termTextView = UITextView(frame: CGRect(x:sideMargin, y: 80, width: screenWidth * 0.868, height:screenHeight * 0.7843))
        termTextView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
    
//        termTextView!.frame = CGRect(x: 0, y: 0, width: 300, height: 100)
        
//        termTextView.frame = CGRect(x: 0, y: 30, width: screenWidth * 0.868, height:screenHeight * 0.7843)
//        termTextView.sizeToFit()
        contetnView.addSubview(termTextView!)

    }
    
    
    override func viewWillLayoutSubviews() {
  
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
