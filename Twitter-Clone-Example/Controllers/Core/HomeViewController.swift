

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    
      //A tableView Inside the viewController's frame
    private func configureNavigationBar() {
        let SIZE:Int = 26
        let twitterLogoView = UIImageView(frame: CGRect(x: 0, y: 0, width: SIZE, height: SIZE))
        twitterLogoView.contentMode = .scaleToFill
        twitterLogoView.image = UIImage(named: "twitterLogo")
        
        let middelView = UIView(frame: CGRect(x: 0, y: 0, width: SIZE, height: SIZE))
        middelView.addSubview(twitterLogoView)
        navigationItem.titleView =  middelView
        
        let profileImage = UIImage(systemName: "person")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(didTapProfile))
        
    }
    
    @objc func didTapProfile() {
        let profileScreen = ProfieVC()
        navigationController?.pushViewController(profileScreen, animated: true)
    }

    
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
        configureNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timeLineTableView.frame = view.frame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        if Auth.auth().currentUser == nil {
           let onboardingVC = UINavigationController(rootViewController: OnboardingVC())
            onboardingVC.modalPresentationStyle = .fullScreen
            present(onboardingVC, animated: true)
        }
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
