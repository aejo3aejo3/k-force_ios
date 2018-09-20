//
//  ChargeController.swift
//  k-force_ios
//
//  Created by John on 2018/5/3.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit

class ChargeController: UIViewController {

    @IBOutlet var gifCharging: UIImageView!
 
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    
    
    @IBOutlet var txtSecs: UILabel!
    @IBOutlet var totalSecs: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(netHex: 0x342e28)
        
        
        // 充電的gif
        gifCharging.loadGif(name: "battery_charging")
        gifCharging.frame = CGRect(x: 0, y: screenHeight * 0.145 , width: screenWidth * 0.48, height: screenHeight * 0.456)
        gifCharging.center.x = view.center.x
        gifCharging.isHidden = true
        
        // 未充電的電池 imageView
        let imgBattery = UIImageView()
        imgBattery.image = UIImage(named: "power")
        imgBattery.frame = CGRect(x: 0, y: screenHeight * 0.145 , width: screenWidth * 0.48, height: screenHeight * 0.456)
        imgBattery.center.x = view.center.x
        self.view.addSubview(imgBattery)
        
        
       // 電池和充電資訊中間的分隔線
        let line = UIImageView()
        line.backgroundColor = UIColor.white
        line.frame = CGRect(x: 0, y: screenHeight * 0.669, width: screenWidth * 0.834, height: screenHeight * 0.00253)
        line.center.x = view.center.x
        
        self.view.addSubview(line)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "立即充電"
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
