//
//this class get search result in search bar using json request for twitter
// and facebook in UISearchController and show them in search display conntrol
//

import UIKit
import TwitterKit

class ViewController: TWTRTimelineViewController {
    @IBOutlet var searchBar: UISearchBar!
    //twitter api
    let client = TWTRAPIClient()
    //twitter rest url
    let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/show.json"
    //twitter error handling
    var clientError : NSError?
    
    override func viewDidLoad() {
        self.dataSource =  TWTRSearchTimelineDataSource(searchQuery: "#hey", apiClient: TWTRAPIClient())
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
                print("yay")
            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
                  print("yay2")
            }
        }
    }
    
    
}

