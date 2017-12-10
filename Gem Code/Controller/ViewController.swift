//
//  File.swift
//  Gem Code
//
//  Created by Merve Ecevit on 10/12/17.
//

import Foundation
import Charts
import UIKit
import UIColor_FlatColors

var currentDate: Double?
var currentValue: Double?
var pastScoin: [Scoin]?


class TableViewController: UITableViewController {
    
    let cellIdentifier = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Scoin"
        self.tableView.register(ScoinCellView.self, forCellReuseIdentifier: self.cellIdentifier)
        self.tableView.isScrollEnabled = true
        self.tableView.backgroundColor = UIColor.background
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        Scoins.fetchPastScoins{ (scoins) -> () in
            pastScoin = scoins
        }
        Scoin.fetchCurrentScoin{ (currentScoin) -> () in
            currentDate = currentScoin.date
            currentValue = currentScoin.value
            var scoin:Scoin?
            scoin = Scoin()
            scoin?.date = currentDate
            scoin?.value = currentValue
            pastScoin?.append(scoin!)
            self.tableView.reloadData()
        }
        
        self.tableView.register(ScoinCellView.self, forCellReuseIdentifier: cellIdentifier)
        let rightBarButtonItemTitle = "↺"
        
        let rBarButtonItem = UIBarButtonItem(title: rightBarButtonItemTitle, style: .plain, target: self, action: #selector(rightBarButtonClicked))
        navigationItem.rightBarButtonItem = rBarButtonItem
        
    }
    @objc func refresh(refreshControl: UIRefreshControl) {
        print("Refresh")
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let count = pastScoin?.count {
            print(count)
            return count
        }
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ScoinCellView {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! ScoinCellView
        
        let date = Date(timeIntervalSince1970: (pastScoin![(pastScoin?.count)! - indexPath.row - 1].date! / 1000.0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy hh:mm"
        let todaysDate = dateFormatter.string(from: date)
        cell.textLabel?.text = "\(todaysDate)"
        cell.detailTextLabel?.text = "\(pastScoin![(pastScoin?.count)! - indexPath.row - 1].value!)"
        cell.backgroundColor = UIColor.background
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel?.textColor = UIColor.white
        cell.imageView?.layer.cornerRadius = 35
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        if pastScoin![(pastScoin?.count)! - indexPath.row - 1].value > pastScoin![(pastScoin?.count)! - indexPath.row - 2].value {
            cell.imageView?.image = UIImage(named: "increase.png")
        }
        else if pastScoin![(pastScoin?.count)! - indexPath.row - 1].value == pastScoin![(pastScoin?.count)! - indexPath.row - 2].value{
            cell.imageView?.image = UIImage(named: "stable.png")
        }
        else{
            cell.imageView?.image = UIImage(named: "decrease.png")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (self.view.frame.height - ((self.navigationController?.navigationBar.frame.height) ?? 0))/7
    }
    
    @objc func rightBarButtonClicked() {
        Scoin.fetchCurrentScoin{ (currentScoin) -> () in
            if(currentScoin.date != pastScoin![(pastScoin?.count)! - 1].date){
                currentDate = currentScoin.date
                currentValue = currentScoin.value
                var scoin:Scoin?
                scoin = Scoin()
                scoin?.date = currentDate
                scoin?.value = currentValue
                pastScoin?.append(scoin!)
                self.tableView.reloadData()
            }
            
        }
    }

}



