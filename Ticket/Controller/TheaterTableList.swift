//
//  MovieTableList.swift
//  Ticket
//
//  Created by Mukil on 03/12/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class TheaterTableList: UIViewController, UITableViewDataSource, UITableViewDelegate{
    // conection for stroybord table cell
    @IBOutlet var mainTable: UITableView!
    //MARK:- collection of Theater list in DB
    var theaterCollection : Results<Theater>!

    override func viewDidLoad() {
        super.viewDidLoad()
        //mainTable is named as table cell drag and droped
        self.mainTable.dataSource = self
        //theaterCollection var is crated to hold the theaterlist of names
        theaterCollection = MyRealm.objects(Theater.self)
        //in this function the table view get the data from the function below
        mainTable.dataSource = self
        mainTable.delegate = self
        mainTable.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //TODO:- function to create tabel delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.theaterCollection.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TheaterTableCell", for: indexPath) as! TheaterTableCell
        let dict = self.theaterCollection[indexPath.row]
        cell.theaterNameCell.text = dict.theaterNameRealm ?? ""
        cell.addressCell.text = dict.addressRealm ?? ""
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = self.theaterCollection[indexPath.row]
        let navigate = UIStoryboard.init(name: "Main", bundle: nil)
        let theater = navigate.instantiateViewController(withIdentifier: "TheaterMovieTableList") as! TheaterMovieTableList
        theater.theaterID = dict.theaterID ?? " "
        
        self.navigationController?.pushViewController(theater, animated: true)
    }
    
}
