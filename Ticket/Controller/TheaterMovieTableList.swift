//
//  TheaterMovieTableList.swift
//  Ticket
//
//  Created by AruniOS on 19/12/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class TheaterMovieTableList: UIViewController,UITableViewDataSource, UITableViewDelegate {
    //var for the list of movie or theater to show
    
    var movieTheaterList : Results<Movie>!
    
    var theaterList = List<Theater>()
    
    var movieID = ""
    var theaterID = ""
    var i = 0
    
      var theaterArray:[Any] = []
    
    //tablecell outlet from storyboard
    @IBOutlet weak var maineTMTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let filter_mov = NSPredicate.init(format: "movieID == %@", movieID)
        let mov = MyRealm.objects(Movie.self).filter(filter_mov)
        
        while i < mov[0].theaterID.count{

            let filter_thr = NSPredicate.init(format: "theaterID == %@", mov[0].theaterID[i])
            let thr = MyRealm.objects(Theater.self).filter(filter_thr)
            self.theaterList.append(thr[0])
            i = i + 1

        }
      
        maineTMTable.dataSource = self
        maineTMTable.delegate = self
        maineTMTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.theaterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TheaterMovieCell", for: indexPath) as! TheaterMovieCell
        let dict = self.theaterList[indexPath.row]
        cell.theaterMovieNameCell.text = dict.theaterNameRealm ?? ""
        cell.theaterMovieAddCell.text = dict.addressRealm ?? ""
        cell.theaterMovieTimeCell.text = String(dict.timeRealm)
        return cell
    }
    //TODO:- function for the tap the Image in collection view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = theaterList[indexPath.row]
        let navigate = UIStoryboard.init(name: "Main", bundle: nil)
        let tessyt = navigate.instantiateViewController(withIdentifier: "AboutMovie") as! AboutMovie
        tessyt.available_cout = dict.avaiableSeatRealm
        self.navigationController?.pushViewController(tessyt, animated: true)
    }
}
