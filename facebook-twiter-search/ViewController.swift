//
//  ViewController.swift
//  facebook-twiter-search
//
//  Created by user on 3/21/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UISearchController {
    //twitter api
    let client = TWTRAPIClient()
    //twitter rest url
    let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/show.json"
    //twitter error handling
    var clientError : NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
//extension for auto search complete
extension ViewController : UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController) {
        //sets the id to current search bar value
        let params = ["id":searchBar.text]
        let request = client.urlRequest(withMethod: "GET", urlString: statusesShowEndpoint, parameters: params, error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            if connectionError != nil {
                print("Error: \(connectionError)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("json: \(json)")
            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
            }
        }
    }
    
    
}

