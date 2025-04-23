//
//  ViewController.swift
//  FriendZone
//
//  Created by Danil Chekantsev on 23.04.2025.
//

import UIKit

class ViewController: UITableViewController {
    
    var friends = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FriendZone"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addFriend)
        )
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = friend.timeZone.identifier
        
        return cell
    }
    
    @objc func addFriend() {
        let friend = Friend()
        friends.append(friend)
        
        tableView.insertRows(
            at: [IndexPath(row: friends.count - 1 ,section: 0)],
            with: .automatic
        )
        
        saveData()
    }
    
    func loadData() {
        let defaults = UserDefaults.standard
        
        guard let savedData = defaults.data(forKey: "Friends") else { return }
        
        let decoder = JSONDecoder()
        if let savedFriends = try? decoder.decode([Friend].self, from: savedData) {
            friends = savedFriends
        }
    }
    
    func saveData() {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        
        if let savedData = try? encoder.encode(friends) {
            defaults.set(savedData, forKey: "Friends")
        }
    }
    
}

