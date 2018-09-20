//
//  MemberController.swift
//  k-force_ios
//
//  Created by John on 2018/5/3.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit

class MemberController: UIViewController {

    @IBOutlet var userPic: UIImageView!
    let screenWidth = GlobalVariable.screenWidth
    let screenHeight = GlobalVariable.screenHeight
    let kFont = "PingFang TC"
    var headView = UIView()
    var summeryView = UIView()
    let btHeight = GlobalVariable.screenHeight * 0.1294
    let btWidth = GlobalVariable.screenWidth * 0.5
    
    @IBOutlet var nickName : UILabel!
    @IBOutlet var btNoti: UIButton!{
        didSet{
            btNoti.frame = CGRect(x: 0, y: screenHeight * 0.5, width: btWidth, height: btHeight)
//            btNoti.frame = CGRect(x: 0, y: 0, width: btWidth, height: btHeight)
//            btNoti.insertSubview(self.view, belowSubview: sum)
            btNoti.setTitle("通知", for: .normal)
            btNoti.titleLabel?.textAlignment = .center
            btNoti.imageEdgeInsets = UIEdgeInsets(top: screenHeight * 0.056, left: screenWidth * 0.141, bottom: screenHeight * 0.04489, right: screenWidth * 0.3)
        }
    }

    @IBOutlet var btFav: UIButton!{
        didSet{
            btFav.frame = CGRect(x: btWidth , y: screenHeight * 0.5, width: btWidth, height: btHeight)
            btFav.titleLabel?.textAlignment = .center
            btFav.imageEdgeInsets = UIEdgeInsets(top: screenHeight * 0.056, left: screenWidth * 0.141, bottom: screenHeight * 0.04489, right: screenWidth * 0.3)

        }
    }


    @IBOutlet var btSetting: UIButton!{
        didSet{
            btSetting.frame = CGRect(x: 0, y: screenHeight * 0.5 + btHeight, width: btWidth, height: btHeight)
            btSetting.titleLabel?.textAlignment = .center
            btSetting.imageEdgeInsets = UIEdgeInsets(top: screenHeight * 0.056, left: screenWidth * 0.141, bottom: screenHeight * 0.04489, right: screenWidth * 0.3)

        }
    }


    @IBOutlet var btTerm: UIButton! {
        didSet{
            btTerm.frame = CGRect(x: btWidth, y: screenHeight * 0.5 + btHeight, width: btWidth, height: btHeight)
            btTerm.titleLabel?.textAlignment = .center
            btTerm.imageEdgeInsets = UIEdgeInsets(top: screenHeight * 0.056, left: screenWidth * 0.141, bottom: screenHeight * 0.04489, right: screenWidth * 0.3)
        }
    }
    
    
  
    
    @IBOutlet var btSignOut: UIButton!{
        didSet{
            let tabBarHeight = self.tabBarController?.tabBar.frame.size.height
            let signHeight = screenHeight * 0.5 - btHeight * 2 - tabBarHeight!
            btSignOut.frame = CGRect(x: 0, y: screenHeight * 0.5 + btHeight * 2, width: screenWidth, height: signHeight)
            btSignOut.titleLabel?.textAlignment = .center
            btSignOut.imageEdgeInsets = UIEdgeInsets(top: screenHeight * 0.056, left: screenWidth * 0.141, bottom: screenHeight * 0.04489, right: screenWidth * 0.3)
        }
    }
    
    
    
    
   
   
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.tabBarController?.navigationItem.title = "會員"
        
//        let tabbarHeight =  tabBarController?.tabBar.frame.size.height
//        print("tab height : \(tabbarHeight)" )
        
        
        initHeadView()
        
        let horizontalLine = UIImageView()
        horizontalLine.backgroundColor = UIColor(netHex: 0xcbcbcb)
        horizontalLine.frame = CGRect(x: 0, y: screenHeight * 0.5 + btHeight, width: screenWidth, height: screenWidth * 0.00416)
        view.addSubview(horizontalLine)

        let horizontalLine2 = UIImageView()
        horizontalLine2.backgroundColor = UIColor(netHex: 0xcbcbcb)
        horizontalLine2.frame = CGRect(x: 0, y: screenHeight * 0.5 + btHeight * 2 , width: screenWidth, height: screenWidth * 0.00416)
        view.addSubview(horizontalLine2)
        
        
        
        let verticalLine = UIImageView()
        verticalLine.backgroundColor = UIColor(netHex: 0xcbcbcb)
        verticalLine.frame = CGRect(x: 0, y: screenHeight * 0.5, width: screenWidth * 0.00416, height: btHeight * 2)
        verticalLine.center.x = view.center.x
        view.addSubview(verticalLine)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*
     * 上半部會員頭像會員名稱的紫色背景區塊
     */
    func initHeadView(){
        headView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight * 0.3547)
        headView.backgroundColor = UIColor(netHex: 0x65669c)
        self.view.addSubview(headView)
        
        userPic.frame = CGRect(x: 0, y: screenHeight * 0.1216, width: 88, height: 88)
        userPic.center.x = headView.center.x
        userPic.setRound()
        headView.addSubview(userPic)
        
        nickName.frame = CGRect(x: 0, y: screenHeight * 0.244, width: screenWidth, height: 50)
        nickName.center.x = headView.center.x
        nickName.textAlignment = .center
        nickName?.textColor = UIColor.white
        nickName?.text = "John Developer"
        nickName?.font = UIFont(name: "HelveticaNeue-Bold", size: 16.7)
        headView.addSubview(nickName!)
        
        
//        NSLayoutConstraint.activate([])
        
       memberSummeryContainer()
        
    }
    
    /*
     * 會員充電資訊統計的白色背景區塊（含陰影）
     */
    func memberSummeryContainer(){
        
        let containerWidth = screenWidth * 0.9138
        let containerHeight = screenHeight * 0.1866
        let sectionWidth = containerWidth * 0.5
        let sectionHeith = containerHeight * 0.5
        
        // 充電資訊的容器UIView
        summeryView.frame = CGRect(x: 0, y: screenHeight * 0.3142, width : containerWidth, height: containerHeight)
        summeryView.center.x = self.view.center.x
        summeryView.backgroundColor = UIColor.white
        setShadow(view: summeryView)
        self.view.addSubview(summeryView)
        
        // 總時間的文字label
        let txtSecs = UILabel(frame: CGRect(x: 0, y: 0, width: sectionWidth, height: sectionHeith))
        txtSecs.textAlignment = .center
        txtSecs.text = "總時間"
        txtSecs.font = UIFont(name: kFont, size: 16)
        txtSecs.textColor = GlobalVariable.kgrayColor
        
        
        summeryView.addSubview(txtSecs)

        // 充電次數的文字label
        let txtCounts = UILabel(frame: CGRect(x: sectionWidth, y: 0, width: sectionWidth, height: sectionHeith))
        txtCounts.text = "充電次數"
        txtCounts.textAlignment = .center
        txtCounts.font = UIFont(name: kFont, size: 16)
        txtCounts.textColor = GlobalVariable.kgrayColor
        summeryView.addSubview(txtCounts)
        
        // 充電時間的數字label
        var totalSecs = UILabel(frame: CGRect(x: 0, y: sectionHeith, width: sectionWidth, height: sectionHeith))
        totalSecs.textAlignment = .center
        totalSecs.font = UIFont(name: kFont, size: 16)
        totalSecs.text = "0 小時 0 分 0 秒"
        totalSecs.textColor = GlobalVariable.kgrayColor
        summeryView.addSubview(totalSecs)
      
        
        // 充電次數的數字label
        var totalCount = UILabel(frame: CGRect(x: sectionWidth, y: sectionHeith, width: sectionWidth, height: sectionHeith))
        totalCount.textAlignment = .center
        totalCount.font = UIFont(name: kFont, size: 16)
        totalCount.text = "12次"
        totalCount.textColor = GlobalVariable.kgrayColor
        summeryView.addSubview(totalCount)
        

//        let line = UIImageView()
//        line.backgroundColor = UIColor.gray
//        line.frame = CGRect(x: 0, y: 0, width: 0.3 , height: 50)
//        line.center.x = view.center.x
//
//        summeryView.addSubview(line)
        
        
        let sectionlLine =  UIImageView()
        let lineHeight = screenHeight * 0.0792
        sectionlLine.backgroundColor = UIColor(netHex: 0xcbcbcb)
        sectionlLine.frame = CGRect(x: sectionWidth, y: (containerHeight - lineHeight) / 2, width: screenWidth * 0.00416, height: lineHeight)
        summeryView.addSubview(sectionlLine)
        
        

            
        
    }
    
    
    func initButtons(){
        
    }
    
    
    
    
    func setShadow( view : UIView){
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: view.bounds.origin.x, y: view.frame.size.height))
//        path.addLine(to: CGPoint(x: view.bounds.width / 2, y: view.bounds.height + 7.0))
//        path.addLine(to: CGPoint(x: view.bounds.width, y: view.bounds.height))
//        path.close()
        
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.cornerRadius = 5
//        view.layer.masksToBounds = false
//        view.layer.shadowPath = path.cgPath
   
//        view.layer.shadowRadius = 5
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

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
