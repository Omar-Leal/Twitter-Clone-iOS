import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Instance of each controller
        let homeViewController =      UINavigationController(rootViewController: HomeViewController())
        let searchViewController =    UINavigationController(rootViewController: SearchViewController())
        let notificationController  = UINavigationController(rootViewController: NotificationsViewController())
        let directMessageController = UINavigationController(rootViewController: DirectMessagesViewController())
        
        // setting icons to each controller
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        homeViewController.tabBarItem.selectedImage  = UIImage(systemName: "house.fill")
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        //setting notification icon
        notificationController.tabBarItem.image = UIImage(systemName: "bell")
        notificationController.tabBarItem.selectedImage = UIImage(systemName: "bell.fill")
        
        directMessageController.tabBarItem.image = UIImage(systemName: "envelope")
        directMessageController.tabBarItem.selectedImage = UIImage(systemName: "envelope.fill")
        
        
        
        setViewControllers([ homeViewController, searchViewController, notificationController, directMessageController ], animated: true)
        
    }


}

