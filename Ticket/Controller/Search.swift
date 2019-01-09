//
//  ViewController.swift
//  Ticket
//
//  Created by Mukil on 26/11/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class Search: UIViewController,UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mainTableSearch: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var filteredData: Results<String>!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainTableSearch.dataSource = self
        searchBar.delegate = self

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateSearchResults(for searchController: UISearchController) {
    }
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       // filteredData(searchTxt : searchText)
    }
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if searchBar.text == ""{
            searchBar.showsCancelButton = false
        }else{
            searchBar.showsCancelButton = true
        }
    }
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
    }
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == ""{
        }else{
//            filteredData(searchTxt: searchName)
            searchBar.resignFirstResponder()
        }
    }
    func searchName(searchText:String) {
        let first = NSPredicate.init(format: " movieNameRealm == %@ ", searchText)
//        let obj = Movie.objects(Movie.self).filter(singleObj).first
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableCell", for:indexPath) as! SearchTableCell
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
}

