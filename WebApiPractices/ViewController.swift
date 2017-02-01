//
//  ViewController.swift
//  WebApiPractices
//
//  Created by Arif on 2/1/17.
//  Copyright © 2017 Arif. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBlogJsonData()
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    
    
    func getBlogJsonData(){
    
    Alamofire.request("http://teledaktar.com/api/v1/blog").responseJSON { response in
    print(response.request)  // original URL request
    print(response.response) // HTTP URL response
    print(response.data)     // server data
    print(response.result)   // result of response serialization
        
        
    let swiftyJsonVar = JSON(response.result.value!)
        
        if let resData = swiftyJsonVar["blogs"].arrayObject {
            
            var arrRes = [[String:AnyObject]]() //Array of dictionary
            
            arrRes = resData as! [[String:AnyObject]]
            
            for eachdata in arrRes {
                
                let title = eachdata["title"]
                let description = eachdata["description"]
                let category = eachdata["categories"]
                let link = eachdata["link"]
                
                print(title)
                print(description)
                print(category)
                print(link)

                
            
            }
            
            
            
            
            
            

        }
        
       
    
    
        
    }

    
    
    }


}


