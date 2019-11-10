//
//  FriendViewController.swift
//  VKClient
//
//  Created by Macbook Air on 31.10.2019.
//  Copyright © 2019 Pavlo. All rights reserved.
//

import UIKit

class FriendsController: UITableViewController {
    
    @IBAction func returnToMyFriends(unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func LogOutButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    static var cityCellId = "FriendsCell"
    
    let friends = [
        User(firstName: "Maxim", lastName: "Alexeev", image: (UIImage(named: "max")!)),
        User(firstName: "Valera", lastName: "Vasilev", image: (UIImage(named: "ivan")!)),
        User(firstName: "Igor", lastName: "Ignat'ev", image: (UIImage(named: "fedor")!)),
        User(firstName: "Elena", lastName: "Fomina", image: (UIImage(named: "max")!)),
        User(firstName: "Oleg", lastName: "", image: (UIImage(named: "ivan")!)),
        User(firstName: "Mikhail", lastName: "Waleev", image: (UIImage(named: "fedor")!)),
        User(firstName: "John", lastName: "Saimon", image: (UIImage(named: "max")!)),
        User(firstName: "Станислав", lastName: "Соловьёв", image: (UIImage(named: "ivan")!)),
        User(firstName: "Соня", lastName: "Валерьевна", image: (UIImage(named: "fedor")!)),
        User(firstName: "Светлана", lastName: "Кожина", image: (UIImage(named: "ivan")!)),
        User(firstName: "Ольга", lastName: "Акулина", image: (UIImage(named: "fedor")!)),
        User(firstName: "Виктор", lastName: "Семёнов", image: (UIImage(named: "max")!)),
        User(firstName: "Владимир", lastName: "Скулак", image: (UIImage(named: "fedor")!)),
        User(firstName: "Владислав", lastName: "Анисимов", image: (UIImage(named: "max")!)),
        User(firstName: "Valdemar", lastName: "ValVal", image: (UIImage(named: "fedor")!)),
        User(firstName: "Volandemort", lastName: "VolVol", image: (UIImage(named: "ivan")!)),
        User(firstName: "Виктория", lastName: "Чечельницкая", image: (UIImage(named: "fedor")!)),
        User(firstName: "Вика", lastName: "Аксёнова", image: (UIImage(named: "max")!)),
        User(firstName: "Витя", lastName: "Малышев", image: (UIImage(named: "fedor")!)),
        User(firstName: "Денис", lastName: "Стройнов", image: (UIImage(named: "ivan")!)),
        User(firstName: "Alex", lastName: "Alexeev", image: (UIImage(named: "fedor")!)),
        User(firstName: "Александр", lastName: "Витамин", image: (UIImage(named: "max")!)),
        User(firstName: "Julia", lastName: "J", image: (UIImage(named: "ivan")!)),
        User(firstName: "Павел", lastName: "Андреич", image: (UIImage(named: "fedor")!)),
        User(firstName: "Anton", lastName: "Smirnov", image: (UIImage(named: "max")!))
    
    ]
    
    var friendsFiltered: [User] = []
    
    var sections: [String] = []
    var friendsInSections: [String: [User]] = [:]
    
    private var selectedFriend: User?
    
    @IBOutlet weak var friendsListTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        friendsListTableView.rowHeight = 66
        
        friendsListTableView.dataSource = self
        friendsListTableView.delegate = self
        
        friendsListTableView.register(UINib(nibName: "Header", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        
        self.friendsFiltered = self.friends
        
        fillSections()
        fillSectionsWithFriends()
    }
    
    // MARK: Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = friendsListTableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! Header
        
        header.backgroundView = UIView(frame: header.bounds)
        header.backgroundView?.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        header.backgroundView?.alpha = 0.1
        header.headerLabel.alpha = 0.6
        header.headerLabel.text = sections[section]
    
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sectionfirstName: String = self.sections[indexPath.section]
        if let friendsInSection: [User] = self.friendsInSections[sectionfirstName] {
            print("""
            select friend "\(friendsInSection[indexPath.row].lastName)"
            """)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
     /*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return friends.count
        }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionfirstName: String = self.sections[section]
        if let friendsInSection: [User] = self.friendsInSections[sectionfirstName] { return friendsInSection.count }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendsListTableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsCell
        
        
        let sectionfirstName: String = self.sections[indexPath.section]
        if let friendsInSection: [User] = self.friendsInSections[sectionfirstName] {
            cell.nameLabel.text = String(friendsInSection[indexPath.row].firstName) + " " + String(friendsInSection[indexPath.row].lastName)
            cell.itemImage.image = friendsInSection[indexPath.row].image
        }
        
        return cell
    }
    // MARK: Table view delegate
        
    
        
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let identifier = segue.identifier, identifier == "forecastSegue" {
            if let indexPath = friendsListTableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination  as? FriendsImagesController {
                    let sectionfirstName: String = self.sections[indexPath.section]
                    if let friendsInSection: [User] = self.friendsInSections[sectionfirstName] {
                        destinationVC.friendInfoList = [(friendsInSection[(indexPath as NSIndexPath).row])]

                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forecastSegue" {
            guard let destinationController = segue.destination as? FriendsImagesController else { return }
            let index = tableView.indexPathForSelectedRow?.row ?? 0
            if friends.count > index {
                let friend = friends[index]
                destinationController.navigationItem.title = String(friend.firstName) + " " + String(friend.lastName)
                destinationController.image = friend.image
            }
        }
    }*/
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            identifier == "forecastSegue",
            let indexPath = friendsListTableView.indexPathForSelectedRow,
            let destinationVC = segue.destination as? FriendsImageController else { return }
        let sectionfirstName: String = self.sections[indexPath.section]
        guard let friendsInSection: [User] = self.friendsInSections[sectionfirstName] else { return }
        let friend = friendsInSection[indexPath.row]
        destinationVC.friend = friend
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections
    }
    
    func filter(query: String) {
        friendsFiltered.removeAll()
        
        var isInFilter = true
        
        for friend in friends {
            if query.count > 0 { isInFilter = (friend.firstName.lowercased().contains(query.lowercased())) }
            if isInFilter { friendsFiltered.append(friend) }
        }
        
        fillSections()
        fillSectionsWithFriends()
    }
    
    func fillSections() {
        sections = Array(Set(friendsFiltered.map { String(($0.firstName.first)!) })).sorted()
    }
    
    func fillSectionsWithFriends() {
        friendsInSections.removeAll()
        
        for friend in friendsFiltered {
            guard let firstLetter = friend.firstName.first else { continue }
            
            var friends: [User] = []
            
            if let friendsInSection = friendsInSections[String(firstLetter)] {
                friends.append(contentsOf: friendsInSection)
            }
            
            friends.append(friend)
            
            friendsInSections[String(firstLetter)] = friends
        }
    }
}
