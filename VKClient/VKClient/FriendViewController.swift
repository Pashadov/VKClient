//
//  FriendViewController.swift
//  VKClient
//
//  Created by Macbook Air on 31.10.2019.
//  Copyright © 2019 Pavlo. All rights reserved.
//

import UIKit

class FriendsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Sometext", style: .plain, target: nil, action: nil)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        
        return cell
    }

    @IBAction func logoutButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func item2Pressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

