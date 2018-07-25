//
//  BaseViewC.swift
//  FirebasePr
//
//  Created by Sandeep_Vishwakarma on 7/24/18.
//  Copyright © 2018 sandeep. All rights reserved.
//

import Foundation
import UIKit

class BaseViewC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //ToDo :- Show alert function
    
    
    @objc func showAlertA(on:UIViewController,title:String?,message:String?,style:UIAlertControllerStyle,actions:[UIAlertAction] = [UIAlertAction(title: "ok", style: .cancel, handler: nil)],completion:(() -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        for action in actions{
            alert.addAction(action)
        }
        on.present(alert, animated: true, completion: completion)
    }
    
}
