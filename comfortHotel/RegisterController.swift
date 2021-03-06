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

//  Upload to Server รับค่ามาจาก - MyConstant Class
    func uploadToServer(name: String,username: String,password: String) -> Void {
        let myconstant = Myconstant()
        let urlPHP:String = myconstant.findURLAddUser(name: name, username: username, password: password)
        print("urlPHP ==> \(urlPHP)")
        
//   Upload Process
        let url = URL(string: urlPHP)
        let request = NSMutableURLRequest(url: url!) //สร้าง - Request จาก Url
        let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
            
            if error != nil {
               print("Have Error")
            }else{
//           Recive Data
                if let testData = data{
                   let canReadData = NSString(data: testData, encoding: String.Encoding.utf8.rawValue)
                    print("can read data ==> \(String(describing: canReadData))")
                    
//                  Show Alert Success Upload or Cannot Upload To Server to console panel
                    let myResponse: String = canReadData! as String
                    if Bool(myResponse)! {
                        print("Success Upload")
//                      Process pop (Back to Main - จะต้องกำหนดชื่อ Identifier ด้วย)
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "BackMain", sender: self)
                        }
                        
                    }else{
                        print("Cannot Upload")
                    }//if
                }//if
            }//if
            //print("error ==> \(String(describing: error))")
        }//End task
        task.resume()
        
    }//uploadToServer
    
//  function Show Alert
    func showAlert(title: String, message: String) -> Void {
        
        let objAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        objAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            objAlert.dismiss(animated: true, completion: nil)
        }))
        self.present(objAlert, animated: true, completion: nil)
    }
    
    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
//      Get Value from TextField
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
//          call function ShowAlert
            showAlert(title: "Have Space", message: "Please fill all every blank")
        }else{
            print("No Space")
            uploadToServer(name: name!, username: username!, password: password!)
        }
        
    } //UploadButton
    
}//Main Class
