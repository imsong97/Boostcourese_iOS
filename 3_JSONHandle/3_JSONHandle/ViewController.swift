//
//  ViewController.swift
//  3_JSONHandle
//
//  Created by YunHo on 2021/06/12.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "cell" // 스토리보드에서 지정한 cell의 identifier
    var friends: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let json: JSONDecoder = JSONDecoder()
        guard let asset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        
        do {
            self.friends = try json.decode([Friend].self, from: asset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }

    // UITableView 필수 구현 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  return self.friends.count
        
    }
    
    // UITableView 필수 구현 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // row마다 해당하는 cell
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let friend: Friend = self.friends[indexPath.row]
        
        cell.textLabel?.text = friend.nameAndAge
        cell.detailTextLabel?.text = friend.fullAddress
        
        return cell
    }
}

