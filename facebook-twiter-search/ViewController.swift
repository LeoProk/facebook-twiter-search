//
//this class get search result in search bar using json request for twitter
// and facebook in UISearchController and show them in search display conntrol
//

import UIKit
import TwitterKit

class ViewController: TWTRTimelineViewController {
    //search bar
    @IBOutlet weak var twittSearch: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        twittSearch.delegate = self
        //set scope buttons
        self.twittSearch.scopeButtonTitles = ["Twitter","Facebook"]
        //get twitts with hey search query and display them in table view
        self.dataSource =  TWTRSearchTimelineDataSource(searchQuery: "hey", apiClient: TWTRAPIClient())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
//extension for auto search complete
extension ViewController : UISearchBarDelegate{
    
    //called at the seachbat touch
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        twittSearch.resignFirstResponder()
    }
    
    //called when use start to type
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    }
    
    //called when user done typing
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //check what current scopbar index is if it's twitter search twitter
        if twittSearch.selectedScopeButtonIndex == 0
        {
            //get twitts with hey search query and display them in table view
            self.dataSource =  TWTRSearchTimelineDataSource(searchQuery: twittSearch.text ?? "", apiClient: TWTRAPIClient())
        }else {
            
            
        }
    }
   
    
}

