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
    
//  Check Authen
    func checkAuthen(user: String, password: String) -> Void {
        let myConstant = Myconstant()
        let urlPHP = myConstant.fineJSONWhereUser(user: user)
        print("urlPHP ==> \(urlPHP)")
        
        guard let url = URL(string: urlPHP) else {
            return
        }//Guard
        
//      task
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let dataResponse = data, error == nil else{
               print("Have Error")
                return
            }//Guard
            
//          do try catch
//          do = คือสิ่งที่ต้องทำ ส่งค่าออกมาเป็น - JSON
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                print("JSONResponse ==> \(jsonResponse)")
            }catch let myError {
                print(myError)
//              ดูค่า  user  ใน database
                print("No have user \(user) in database")
                
//              ขัดจังหวะการทำงานให้เลิก ทำสิ่งที่กำลังทำอยู่ แล้วให้มาทำรายการที่ 2 ก่อน ถ้าไม่ใช้ DispatchQueue จะเกิด  Error
//              Check username in database
                DispatchQueue.main.async {
//                   Call use function myAlert
                    self.myAlert(title: "User False", message: "No have user \(user) in database")
                }
            }//Do
            
        } //End task
        task.resume()
    }//checkAuthen function
    
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

// Button Sign in
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
//          Call function CheckAuthen for check login
            checkAuthen(user: username!, password: password!)
        }
        
//      Show Log
        print("username ==> \(String(describing: username))")
        print("password ==> \(String(describing: password))")
    }
    
}//Main Class

