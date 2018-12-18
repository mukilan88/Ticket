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
        self.mainTable.dataSource = self
        try! MyRealm.write {
            MyRealm.create(Theater.self, value: ["theaterID" :"1", "theaterNameRealm":"Sangam Cinemas 4K Dolby Atmos", "addressRealm":"Kilpauk", "avaiableSeatRealm":15, "dateRealm":20, "timeRealm":8, "amountRealm":120], update:true)
            MyRealm.create(Theater.self, value: ["theaterID" :"2","theaterNameRealm":"DeviCineplex", "addressRealm":"Anna Salai", "avaiableSeatRealm":18, "dateRealm":20, "timeRealm":11, "amountRealm":120], update:true)
            MyRealm.create(Theater.self, value: ["theaterID" :"3","theaterNameRealm":"Kasi 4K Dolby Atmos", "addressRealm":"Ashok Nagar", "avaiableSeatRealm":5, "dateRealm":20, "timeRealm":2, "amountRealm":120], update:true)
            MyRealm.create(Theater.self, value: ["theaterID" :"4","theaterNameRealm":"Udhayam Complex", "addressRealm":"JafferKhanpet", "avaiableSeatRealm":12, "dateRealm":20, "timeRealm":4, "amountRealm":120], update:true)
            MyRealm.create(Theater.self, value: ["theaterID" :"5","theaterNameRealm":"Vettri Theatres RGB Laser", "addressRealm":"Chrompet", "avaiableSeatRealm":11, "dateRealm":20, "timeRealm":7, "amountRealm":120], update:true)
            MyRealm.create(Theater.self, value: ["theaterID" :"6","theaterNameRealm":"Albert Complex", "addressRealm":"Egmore", "avaiableSeatRealm":2, "dateRealm":20, "timeRealm":10, "amountRealm":120], update:true)
            MyRealm.create(Theater.self, value: ["theaterID" :"7","theaterNameRealm":"EGA Cinemas", "addressRealm":"Kilpauk", "avaiableSeatRealm":14, "dateRealm":20, "timeRealm":11, "amountRealm":120], update:true)
            MyRealm.create(Theater.self, value: ["theaterID" :"8","theaterNameRealm":"Kamala Cinemas", "addressRealm":"Vadapalani", "avaiableSeatRealm":6, "dateRealm":20, "timeRealm":3, "amountRealm":120], update:true)
            MyRealm.create(Theater.self, value: ["theaterID" :"9","theaterNameRealm":"Rakki Cinemas", "addressRealm":"Ambattur", "avaiableSeatRealm":20, "dateRealm":20, "timeRealm":10, "amountRealm":120], update:true)
            MyRealm.create(Theater.self, value: ["theaterID" :"10","theaterNameRealm":"Lakshmi Bala Movie Park A/C", "addressRealm":"Padi", "avaiableSeatRealm":20, "dateRealm":20, "timeRealm":4, "amountRealm":120], update:true)
        }
        theaterCollection = MyRealm.objects(Theater.self)
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
}
