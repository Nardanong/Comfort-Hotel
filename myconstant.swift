//
//  myconstant.swift
//  comfortHotel
//
//  Created by TST-APP-02 on 9/5/2562 BE.
//  Copyright © 2562 Hitachi. All rights reserved.
//

import Foundation

//Web Service
class Myconstant {
    
//  web service recive value from database
    func fineJSONWhereUser(user: String) -> String {
        let result = "http://www.hitachi-tstv.com/test_ios/getUserWhereUserPu.php?isAdd=true&username=\(user)"
        return result
        
    }//fineJSONWhereUser
    
//  Web service send value add user to database
    func findURLAddUser(name:String,username:String,password:String) -> String {
        let result = "http://www.hitachi-tstv.com/test_ios/addUserPu.php?isAdd=true&name=\(name)&username=\(username)&password=\(password)"
        return result
    }
    
} //myconstant class
