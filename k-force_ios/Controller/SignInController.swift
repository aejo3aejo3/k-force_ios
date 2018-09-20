//
//  SignInController.swift
//  k-force_ios
//
//  Created by John on 2018/4/20.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit
import GoogleSignIn

import FacebookLogin
import FacebookCore
import FBSDKLoginKit

class SignInController: UIViewController , GIDSignInUIDelegate,FBSDKLoginButtonDelegate {
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        fetchProfile()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }


    
    @IBOutlet var btFacebook: UIButton!

    @IBOutlet var btSignIn : UIButton! {
        didSet {
            btSignIn.layer.cornerRadius = 17.2
            btSignIn.layer.masksToBounds = true
        }
    }
    
    

    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    

        
        // 初始化登入 google client
       GIDSignIn.sharedInstance().uiDelegate = self
    
    
        // 如果token沒過期維持登入狀態
        if FBSDKAccessToken.current() != nil {
            fetchProfile()
        } else {
            print("fb token is expired")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    
        
    }

    @IBAction func signWithGoogle(_ sender : UIButton){
        GIDSignIn.sharedInstance().signIn()
    }
    

    @IBAction func signWithFacebook(_ sender : UIButton) {
        let loginManager : FBSDKLoginManager = FBSDKLoginManager()
        
        loginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in

            if error != nil {
                print("fb sign error : \(error)")
            } else if (result != nil) && (result?.isCancelled)! {
                print("manager fb login cancel")
            } else {
                print("manager fb login success")

                self.fetchProfile()

            }
        }
        
      
        
    }
    
    /*
     * 獲取使用者fb資料
     */
    
    func fetchProfile(){
        
        print("attemp to fetch profile")
        
        
        let params = ["fields" : "email, first_name, last_name"]
        
        FBSDKGraphRequest(graphPath: "me", parameters: params).start { (connection, result, error) -> Void in
            
            if error != nil {
                print("fb login error : \(error)")
            } else {
                if let fbResult = result as? [String : Any] {
                    
                    print("login sucess")
                    
                    
                    if let email : String = fbResult["email"] as! String {
                        print("email : \(email)")
                    }
                    
                    if let name :  String = fbResult["first_name"] as! String {
                        print("name : \(name)")
                    }
                    
               
                }
            }
            
        }
        
    }
    
    

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//
//        if segue.identifier == "toSignUp" {
//
//            let desController = segue.destination as! SignUpController
////            self.present(desController, animated: true, completion: nil)
//            show(desController, sender: sender)
//        }
//
//
//    }
//
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
