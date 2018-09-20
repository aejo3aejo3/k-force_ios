//
//  NotificationController.swift
//  k-force_ios
//
//  Created by John on 2018/5/8.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit

class NotificationController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    let screenWidth = GlobalVariable.screenWidth
    let screenHeight = GlobalVariable.screenHeight
   
    

    @IBOutlet var mTableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mTableView.delegate = self
        mTableView.dataSource = self
        
        // Do any additional setup after loading the view
        mTableView.separatorStyle = .none

        

//        mTableView.translatesAutoresizingMaskIntoConstraints = false
//        mTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 25).isActive = true
//        mTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true

//        mTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
//        mTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10).isActive = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 回傳幾個sell ex: return list.count
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = mTableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationCell

        
        // cell的邊框
        cell.layer.borderWidth = 1.5
        cell.layer.borderColor = UIColor(netHex: 0xEEEEEE).cgColor
        cell.layer.cornerRadius = 4
     
        // cell的shaow
        cell.layer.shadowOffset = CGSize(width:2, height: 2)
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowRadius = 0.5
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.masksToBounds = false

        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenHeight * 0.1188
   
    }
    
    /*
     * 每個cell的間隔高度
     * 回傳section.count才可以用這個方法加入cell的間隔 而不是回傳cell.count好
     */
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return screenHeight * 0.00968
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
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
