

import UIKit

class HomeViewController: UIViewController {

    
      //A tableView Inside the viewController's frame
    
    
    private let timeLineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(timeLineTableView)
        timeLineTableView.delegate = self
        timeLineTableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timeLineTableView.frame = view.frame
    }

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as! TweetTableViewCell
        cell.delegateAction = self
        return cell
    }
    
   
    
}


extension HomeViewController: TweetTableViewDelegate {
    func TweetTableViewDidTapReply() {
        print("you've print out a reply")
    }
    
    func TweetTableViewCellDidTabRetweet() {
        print("you've print out a re-tweet")
    }
    
    func TweetTableViewCellDidTabLike() {
        print("you've print out a LIKE")
    }
    
    func TweetTableViewCellDidTabShared() {
        print("you've print out a SHARE")
    }
    
    
}
