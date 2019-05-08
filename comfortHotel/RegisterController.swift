//
//  RegisterController.swift
//  comfortHotel
//
//  Created by TST-APP-02 on 8/5/2562 BE.
//  Copyright © 2562 Hitachi. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {
//  Expicit
    var name:String?
    var username:String?
    var password:String?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }//Main Method
    
    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
        name = nameTextField.text
        username = userTextField.text
        password = passwordTextField.text
        
//      Show log
        print("name ==> \(String(describing: name))")
        print("username ==> \(String(describing: username))")
        print("password ==> \(String(describing: password))")
        
//      Check Space
        if (name!.count == 0) || (username!.count==0) || (password!.count==0) {
//      Have Space
            print("Have Space")
        }else{
            print("No Space")
        }
        
    } //UploadButton
    
}//Main Class
