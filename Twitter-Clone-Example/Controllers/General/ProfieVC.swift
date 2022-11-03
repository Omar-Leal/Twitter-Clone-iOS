import UIKit

class ProfieVC: UIViewController {
    
    private var isStatusBardHidden: Bool = true
    
    
    private let statusVar: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.opacity = 0
       return view
    }()
    
    private let profileTableView: UITableView = {
        let table = UITableView()
        table.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        view.addSubview(profileTableView)
        view.addSubview(statusVar)
        let headerUVIew = ProfileTableViewHeader(frame: CGRect(x: 0, y: 0, width: profileTableView.frame.width, height: 412))
        profileTableView.tableHeaderView = headerUVIew
        navigationController?.navigationBar.isHidden = true
        
        profileTableView.contentInsetAdjustmentBehavior = .never // Ignoring the safe area
        
        
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
        
        let statusBarConstraints = [
            statusVar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusVar.topAnchor.constraint(equalTo: view.topAnchor),
            statusVar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusVar.heightAnchor.constraint(equalToConstant: view.bounds.height > 800 ? 40 :  20)
        ]
        
        
        NSLayoutConstraint.activate(profileScreen)
        NSLayoutConstraint.activate(statusBarConstraints)
        //[statusBarConstraints ].forEach(NSLayoutConstraint.activate)
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPosition = scrollView.contentOffset.y
        if yPosition > 140 { // this is the height of the background header image
           // print("scrollview \(yPosition)")
            isStatusBardHidden = false
            UIView.animate(withDuration: 0.3, delay: 0,  options: .curveLinear) { [weak self] in
                self?.statusVar.layer.opacity = 1
            } completion: { _ in }
            
        } else if yPosition < 0 && !isStatusBardHidden {
            isStatusBardHidden = true
            UIView.animate(withDuration: 0.3, delay: 0,  options: .curveLinear) { [weak self] in
                self?.statusVar.layer.opacity = 0
            } completion: { _ in }
        }
    }
    
    
}
