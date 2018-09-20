//
//  SettingController.swift
//  k-force_ios
//
//  Created by John on 2018/5/8.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit

class SettingController: UIViewController , UITextFieldDelegate{

    let screenWidth = GlobalVariable.screenWidth
    let screenHeight = GlobalVariable.screenHeight
    let edtWidth = GlobalVariable.screenWidth * 0.67
    let txtLeftMargin = GlobalVariable.screenWidth * 0.1486
    let edtLeftMargin = GlobalVariable.screenWidth * 0.3069
    let accountTopMargin = GlobalVariable.screenHeight * 0.279
    let pwTopMargin = GlobalVariable.screenHeight * 0.3794
    let nameTopMargin = GlobalVariable.screenHeight * 0.4815
    let bkMailTopMargin = GlobalVariable.screenHeight * 0.582
    let kblack = GlobalVariable.ktxtBlack
    
    
    @IBOutlet var imgUserPic: UIImageView!{
        didSet{
            let width = screenWidth * 0.1486
            imgUserPic.frame = CGRect(x: edtLeftMargin, y: screenHeight * 0.1214, width: width, height: width)
            imgUserPic.backgroundColor = GlobalVariable.kthemeColor
            imgUserPic.setRound()
            
        }
    }
    @IBOutlet var txtUserPic: UILabel!{
        didSet{
            txtUserPic.textColor = kblack
            txtUserPic.frame = CGRect(x: txtLeftMargin, y: screenHeight * 0.1584, width: 50, height: 20)
            txtUserPic.sizeToFit() // wrap content
            
        }
    }
    @IBOutlet var txtAccount: UILabel!{
        didSet{
            txtAccount.textColor = kblack
            txtAccount.frame = CGRect(x: txtLeftMargin, y: accountTopMargin, width: 50, height: 20)
            txtAccount.sizeToFit() // wrap content
            
        }
    }
    @IBOutlet var txtMail: UILabel!{
        didSet{
            txtMail.textColor = kblack
            txtMail.text = "mail@mail.com"
            txtMail.frame = CGRect(x: edtLeftMargin, y: accountTopMargin, width: 50, height: 20)
            txtMail.sizeToFit() // wrap content
        }
    }
    @IBOutlet var txtPw: UILabel!{
        didSet{
            txtPw.textColor = kblack
            txtPw.frame = CGRect(x: txtLeftMargin, y: pwTopMargin, width: 50, height: 20)
            txtPw.sizeToFit() // wrap content
        }
    }
    @IBOutlet var txtName: UILabel!{
        didSet{
            txtName.textColor = kblack
            txtName.frame = CGRect(x: txtLeftMargin, y: nameTopMargin, width: 50, height: 20)
            txtName.sizeToFit() // wrap content
        }
    }
    
    @IBOutlet var txtBKMail: UILabel!{
        didSet{
            txtBKMail.textColor = kblack
            txtBKMail.frame = CGRect(x:screenWidth * 0.043, y: bkMailTopMargin, width: 50, height: 20)
            txtBKMail.sizeToFit() // wrap content
        }
    }
    @IBOutlet var edtPw: UITextField!{
        didSet{
            
            edtPw.textColor = kblack
            edtPw.frame = CGRect(x: edtLeftMargin, y: pwTopMargin, width: edtWidth, height: 20)
            edtPw.borderStyle = .none
            edtPw.delegate = self
            edtPw.tag = 1
            edtPw.becomeFirstResponder()
            edtPw.setAccountSettingBorder()

        }
    }
    @IBOutlet var edtName: UITextField!{
        didSet{
            edtName.textColor = kblack
            edtName.frame = CGRect(x: edtLeftMargin, y: nameTopMargin, width: edtWidth, height: 20)
            edtName.delegate = self
            edtName.tag = 2
            edtName.setAccountSettingBorder()
          
        }
    }
    @IBOutlet var edtBKMail: UITextField!{
        didSet{
            edtBKMail.textColor = kblack
            edtBKMail.frame = CGRect(x: edtLeftMargin, y: bkMailTopMargin, width: edtWidth, height: 20)
            edtBKMail.delegate = self
            edtBKMail.tag = 3
            edtBKMail.setAccountSettingBorder()
        
        }
    }
    @IBOutlet var btChangePIc: UIButton!{
        didSet{
            btChangePIc.setTitleColor(UIColor(netHex: 0xa1a1a1), for: .normal)
            btChangePIc.frame = CGRect(x: screenWidth * 0.5, y: screenHeight * 0.1382, width: screenWidth * 0.345, height: screenHeight * 0.0616)
            // 設定外框線
            btChangePIc.layer.borderWidth = 1.5
            btChangePIc.layer.borderColor = UIColor(netHex: 0xEEEEEE).cgColor
            btChangePIc.layer.cornerRadius = 9
            // 設定陰影
            btChangePIc.layer.shadowOffset = CGSize(width: 2, height: 2)
            btChangePIc.layer.shadowOpacity = 0.1
            btChangePIc.layer.shadowRadius = 0.5
            btChangePIc.layer.shadowColor = UIColor.lightGray.cgColor
            btChangePIc.layer.masksToBounds = false
            
        }
    }
    @IBOutlet var btConfirm: UIButton!{
        didSet{
            btConfirm.setTitleColor(UIColor.white, for: .normal)
            btConfirm.backgroundColor = GlobalVariable.kthemeColor
            btConfirm.frame = CGRect(x: 0 ,y: screenHeight * 0.7931, width: screenWidth * 0.333, height: screenHeight * 0.06)
            btConfirm.layer.cornerRadius = 22
        }
    }
    
    
    
    /*
     * 點擊textField以外的地方則隱藏keyboard
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
     * 在textField按下return後的事件監聽
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //  按return後往下一格移動
        if let nextTextField = view.viewWithTag(textField.tag + 1){
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }
        
        // 當textField在最後一格按下turn的時候隱藏keyboard
        if textField.tag == 3{
            textField.endEditing(true)
        }
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        btConfirm.center.x = self.view.center.x
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
