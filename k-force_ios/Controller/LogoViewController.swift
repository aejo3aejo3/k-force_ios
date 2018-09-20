//
//  ViewController.swift
//  k-force_ios
//
//  Created by John on 2018/4/19.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit

class LogoViewController : UIViewController {

    
    let TAG = "LogoViewController"
    
    
    @IBOutlet var kforce : UILabel!
    @IBOutlet var gradientView : UIView!
//    @IBOutlet var bt : UIButton!
    

    var gradientLayer : CAGradientLayer!
    var startColor : UIColor?
    var endColor : UIColor?
    
    @IBOutlet var imgLogo : UIImageView!
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        

//        let mylogo = UIImage(named: "email")
//        let logo = UIImageView(image: mylogo!)
//        logo.frame = CGRect(x: screenWidth * 0.3025, y: screenHeight * 0.3184, width: 100, height: 200)
        
//        view.addSubview(logo)
  
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
     * 漸層背景
     */
    func backgroundGradient(){

        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
     
        
        startColor = UIColor(netHex: 0x585990)
        endColor = UIColor(netHex: 0x101043 )
        gradientLayer.colors = [ startColor!.cgColor, endColor!.cgColor]
        gradientView.layer.addSublayer(gradientLayer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        backgroundGradient()
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        // 之後把sleepe改回來
        sleep(UInt32(2.0))
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "SignInController")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
    }
    
}

