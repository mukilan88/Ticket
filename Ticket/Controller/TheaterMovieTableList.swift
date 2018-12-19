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
    var theaterMovieList : Results<Theater>!
    var movieTheaterList : Results<Movie>!
    
    var theaterList = Array<Any>()
    
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
        
        print("***********  ",mov[0].theaterID)
        
        print("!!!!!!!!!!!!  ",mov[0].theaterID.count)
      
        
        while i < mov[0].theaterID.count{

            print(">>>>>>>>>>>>>>>>  ",mov[0].theaterID[i])
//
            let filter_thr = NSPredicate.init(format: "theaterID == %@", mov[0].theaterID[i])
            let thr = MyRealm.objects(Theater.self).filter(filter_thr)
//

            
            
            self.theaterList.append(thr)
//
            i = i + 1
//
        }
      
       
//        theaterArray.append(mov[0].theaterID)
//
        print("***********  ",self.theaterMovieList)
//
//        let filter_theater = NSPredicate.init(format: "theaterID == %@", theaterID)
//        let movTheater = MyRealm.objects(Theater.self).filter(filter_theater)
        
        //print("***********  ",movTheater[0].movieID)
//        maineTMTable.dataSource = self
//        maineTMTable.delegate = self
//        maineTMTable.reloadData()
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
        let dict = self.theaterMovieList[indexPath.row]
        cell.theaterMovieNameCell.text = dict.theaterNameRealm ?? ""
        cell.theaterMovieAddCell.text = dict.addressRealm ?? ""
        cell.theaterMovieTimeCell.text = String(dict.timeRealm)
        return cell
    }
}
