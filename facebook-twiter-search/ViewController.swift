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
        let client = TWTRAPIClient()
        client.loadTweet(withID: searchBar.text!) { (tweet, error) in
            if let t = tweet {
                
            } else {
                print("Failed to load Tweet: \(error?.localizedDescription)")
            }
        }
    }
    
    
}

