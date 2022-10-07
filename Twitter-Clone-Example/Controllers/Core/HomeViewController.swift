

import UIKit

class HomeViewController: UIViewController {

    
      //A tableView Inside the viewController's frame
    
    
    private let timeLineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableView.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timeLineTableView)
         
    }
    


}
