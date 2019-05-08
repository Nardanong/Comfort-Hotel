//
//  RegisterViewController.swift
//  comfortHotel
//
//  Created by TST-APP-02 on 4/5/2562 BE.
//  Copyright © 2562 Hitachi. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var name:String?
    var user:String?
    var pass:String?

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() { 
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }//Main Method
    
    
    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
        
//    Get value from textfield
        name = nameTextField.text
        user = usernameTextField.text
        pass = passwordTextField.text
        
//    Show log
        print("name ==> \(String(describing: name))")
        print("user ==> \(String(describing: user))")
        print("pass ==> \(String(describing: pass))")
        
    }//upload button
    
    

} //Main Class
