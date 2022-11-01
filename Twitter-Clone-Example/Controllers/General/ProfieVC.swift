import UIKit

class ProfieVC: UIViewController {
    
    private let profileTableView: UITableView = {
        let table = UITableView()
        table.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        navigationItem.title = "Profile"
        view.addSubview(profileTableView)
        
        let headerUVIew = ProfileTableViewHeader(frame: CGRect(x: 0, y: 0, width: profileTableView.frame.width, height: 370))
        profileTableView.tableHeaderView = headerUVIew
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        constraints()
    }

  
    
    private func constraints() {
        // let's stretch the table to the bound of the screen
        let profileScreen = [
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.topAnchor.constraint(equalTo: view.topAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(profileScreen)
    }

    

}

extension ProfieVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath)
        as? TweetTableViewCell else  {
            return UITableViewCell()
        }
                
          
        
        return cell
    }
    
}
