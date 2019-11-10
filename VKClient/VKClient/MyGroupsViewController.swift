//
//  MyGroupsViewController.swift
//  VKClient
//
//  Created by Macbook Air on 10.11.2019.
//  Copyright © 2019 Pavlo. All rights reserved.
//

import UIKit

class MyGroupsController: UITableViewController {
    
    var groups: [(name: String, image: UIImage)] = []
    
    @IBAction func returnToMyGroups(unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "addGroup" {
            guard let allGroupsController = unwindSegue.source as? AllGroupsController else { return }
            guard let indexPath = allGroupsController.tableView.indexPathForSelectedRow else { return }
            
            let group = allGroupsController.groups[indexPath.row]
            if !groups.contains(where: { $0.name == group.name }) {
                groups.append(allGroupsController.groups[indexPath.row])
                tableView.reloadData()
            }
        }
    }
    
    // MARK: Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as! GroupsCell
        cell.nameLabel.text = groups[indexPath.row].name
        cell.itemImage.image = groups[indexPath.row].image
        return cell
    }
    
    // MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
}

