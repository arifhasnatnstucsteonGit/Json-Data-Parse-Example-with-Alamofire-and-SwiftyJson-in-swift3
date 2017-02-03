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

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    @IBOutlet weak var tableView: UITableView!

    
    @IBOutlet weak var tableview: UITableView!
    
    var data = ["one","two","three"]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        getBlogJsonData()
        
        print("fsdfsd" , self.arrRes.count)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
         var dict = arrRes[(indexPath as NSIndexPath).row]
        
        cell.names.text = dict["title"] as? String
        
        
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        code
//    }
    
    
    
    
    func getBlogJsonData(){
    
    Alamofire.request("http://teledaktar.com/api/v1/blog").responseJSON { response in
    print(response.request)  // original URL request
    print(response.response) // HTTP URL response
    print(response.data)     // server data
    print(response.result)   // result of response serialization
        
        
    let swiftyJsonVar = JSON(response.result.value!)
        
        if let resData = swiftyJsonVar["blogs"].arrayObject {
            
            
            self.arrRes = resData as! [[String:AnyObject]]
            self.tableview.reloadData()
            
//            for eachdata in self.arrRes {
//                
//                let title = eachdata["title"]
//                let description = eachdata["description"]
//                let category = eachdata["categories"]
//                let link = eachdata["link"]
//                
//                print(title)
//                print(description)
//                print(category)
//                print(link)
//
//                
//            
//            }
            
    }
}

}


}


