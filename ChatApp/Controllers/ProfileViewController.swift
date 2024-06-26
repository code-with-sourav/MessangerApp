//
//  ProfileViewController.swift
//  ChatApp
//
//  Created by sourav_singh on 21/05/24.
//

import UIKit


class ProfileViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let data = ["log Out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textColor = .red
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
//        alert.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { [weak self] _ in
//            
//            guard let strongSelf = self else{
//                
//            }
//                    
//                    do {
//                        try firebaseAuth.Auth.auth(.signOut)
//                        
//                        let vc = LoginViewController()
//                        let nav = UINavigationController(rootViewController: vc)
//                        nav.modalPresentationStyle = .fullScreen
//                        present(nav, animated: true)
//                        
//                    }
//                    catch  {
//                        print("Failed to log out")
//                    }
//             
//        }))
        
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true)
        
        
    }
}
