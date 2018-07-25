//
//  ViewController.swift
//  FirebasePr
//
//  Created by Sandeep_Vishwakarma on 7/24/18.
//  Copyright © 2018 sandeep. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegistrationViewC: BaseViewC {

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

    @IBAction func SignupButtonPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user,error) in
            
            if error != nil {
                SVProgressHUD.dismiss()
                super.showAlertA(on: self, title: ConstentTexts.signInError.rawValue, message: error?.localizedDescription , style: .alert)
            }
            else {
               print("You have successfully Registered Your self")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "gotoHome", sender: self)
            }
        }
    }
    
}

