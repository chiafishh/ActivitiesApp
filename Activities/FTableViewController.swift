//
//  FTableViewController.swift
//  Activities
//
//  Created by User23 on 2019/1/11.
//  Copyright © 2019 Chiafishh. All rights reserved.
//

import UIKit
import Foundation

class FTableViewController: UITableViewController {

    var acts =  [Act1]()
    var showInfos = [ShowInfo0]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let urlStr = "https://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindIssueTypeJ".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr) {
                 let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
                     let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                     if let data1 = data, let act0 = try? decoder.decode(Act0.self, from: data1) {
                         self.acts = act0.issue
                         print(self.acts)
                         DispatchQueue.main.async {
                            self.tableView.reloadData()
                         }
                     }
                 }
                 task.resume()
             }
 
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("count", acts.count )
        return acts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "act0Cell", for: indexPath) as! Act0TableViewCell
        
        // Configure the cell...
        let act1 = acts[indexPath.row]
        cell.titleLabel.text = act1.title
        
        let task = URLSession.shared.dataTask(with: act1.imageUrl) { (data, response , error) in
            if let data = data {
                DispatchQueue.main.async {
                    cell.actImg.image = UIImage(data: data)
                }
            }
        }
        task.resume()
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let controller = segue.destination as? DetailViewController
        if let row = tableView.indexPathForSelectedRow?.row {
            let act1 = acts[row]
            controller?.act1 = act1
        }
    }
}
