//
//  LogInViewC.swift
//  FirebasePr
//
//  Created by Sandeep_Vishwakarma on 7/24/18.
//  Copyright © 2018 sandeep. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import SVProgressHUD

class LogInViewC: BaseViewC {

    //MARK:- All IBOutlet
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
        
    //MARK:- View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK:- User Action
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                SVProgressHUD.dismiss()
                super.showAlertA(on: self, title: ConstentTexts.signInError.rawValue, message: error?.localizedDescription , style: .alert)
            }
            else {
                print("You have logged in successfully")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "gotoHomeVc", sender: self)
            }
        }
//        Auth.auth().signInAnonymously { (user, error) in
//            if error != nil {
//                SVProgressHUD.dismiss()
//                super.showAlertA(on: self, title: ConstentTexts.signInError.rawValue, message: error?.localizedDescription , style: .alert)
//            }
//            else {
//                print("You have logged in successfully")
//                SVProgressHUD.dismiss()
//                self.performSegue(withIdentifier: "gotoHomeVc", sender: self)
//            }
//        }
    }
    
    //TODO:- Facebook button Pressed.s
    
    @IBAction func facebookButtonPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        let fbSdkLogInManager = FBSDKLoginManager()
        fbSdkLogInManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                super.showAlertA(on: self, title: ConstentTexts.fbloginError.rawValue, message: error.localizedDescription, style: .alert)
            }
            guard let accessToken = FBSDKAccessToken.current()  else {
                super.showAlertA(on: self, title: ConstentTexts.accessTokenError.rawValue, message: ConstentTexts.somthingWentWorng.rawValue, style: .alert)
                return
            }
            
            let crediential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            print(crediential)
            Auth.auth().signInAndRetrieveData(with: crediential) { (user, error) in
                if error != nil {
                    SVProgressHUD.dismiss()
                    super.showAlertA(on: self, title: ConstentTexts.signInError.rawValue, message: error?.localizedDescription , style: .alert)
                }
                else {
                    print("You have logged in successfully")
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "gotoHomeVc", sender: self)
                }
            }
            guard let result = result else {return}
            
            if result.isCancelled {
                return
            }
            else {
                
            }
        }
    }
  
}
