//
//  ViewController.swift
//  Ticket
//
//  Created by Mukil on 26/11/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit

class Search: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mainTableSearch: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //TODO:- Function to create table view delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableCell", for: indexPath) as! SearchTableCell
        //let dict = self.traitCollection[indexPath.row]
        //cell.searchNameCell.text = dict.theaterNameRealm ?? ""
        return cell
    }
    //TODO:- Search bar
//    func updateSearchResults(for searchController: UISearchController) {
//        <#code#>
//    }
}

