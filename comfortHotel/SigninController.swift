//
//  ViewController.swift
//  PuService_04052019
//
//  Created by TST-APP-02 on 4/5/2562 BE.
//  Copyright © 2562 Hitachi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//Expilcit
    var username: String?
    var password: String?
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//Main Method
    
//  function Show Alert
    func myAlert(title: String, message:String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
//  Check Space By use function
    func checkSpace(username: String, password:String) -> Bool {
        var result: Bool?
        if (username.count == 0) || (password.count == 0){
            result = true
        }else{
            result = false
        }//if
        
        return result!
        
    }//checkSpace

    @IBAction func SinginButton(_ sender: UIButton) {
//      Get Value from TextField
        username = userTextField.text
        password = passTextField.text
        
//      Call function checkSpace
        if(checkSpace(username: username!, password: password!)){
            print("Have Space")
//          Call function myAlert
            myAlert(title: "Have Space", message: "Please fill all blank")
        }else{
            print("No Space")
        }
        
//      Show Log
        print("username ==> \(String(describing: username))")
        print("password ==> \(String(describing: password))")
    }
    
}//Main Class

