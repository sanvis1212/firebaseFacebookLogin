//
//  HomeViewC.swift
//  FirebasePr
//
//  Created by Sandeep_Vishwakarma on 7/24/18.
//  Copyright © 2018 sandeep. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class HomeViewC: BaseViewC {

    //MARK:- All IBOutlet

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    
    //MARK:- View Life Cycle
    
    override func viewDidLoad() {
         super.viewDidLoad()
         self.userNameLabel.text = ""
        
        if let _ = FBSDKAccessToken.current() {
            fetchUserData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- log out Button Pressed
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        }
        catch {
            super.showAlertA(on: self, title: ConstentTexts.logOutError.rawValue, message: error.localizedDescription, style: .alert)
        }
    }
    
    private func fetchUserData() {
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, email, name, picture.width(480).height(480)"])
        graphRequest?.start(completionHandler: { (connection, result, error) in
            if error != nil {
                print("Error",error!.localizedDescription)
            }
            else{
                print(result!)
                let field = result! as? [String:Any]
                self.userNameLabel.text = field!["name"] as? String
                if let imageURL = ((field!["picture"] as? [String: Any])?["data"] as? [String: Any])?["url"] as? String {
                    print(imageURL)
                    let url = URL(string: imageURL)
                    let data = NSData(contentsOf: url!)
                    let image = UIImage(data: data! as Data)
                    self.profileImageView.image = image
                }
            }
        })
    }
    
}

















