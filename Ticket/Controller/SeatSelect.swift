//
//  SeatNo.swift
//  Ticket
//
//  Created by Mukil on 12/12/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class SeatSelect: UIViewController {

    @IBOutlet weak var seatNum: UIButton!
    var selectSeatOn = true
    var SavedList : Results<Seat>!
    var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        GETSAVEDDATAS()
    }
    func GETSAVEDDATAS(){
        SavedList = MyRealm.objects(Seat.self)
        while i<SavedList.count{
            print("SAVED Seat No>>>>>>  ",SavedList[i].seatNumRealm ?? "")
            i = i+1
        }
    }
    @IBAction func seatNumber(_ sender: UIButton) {
        selectSeatOn = !selectSeatOn
        if selectSeatOn{
            view.backgroundColor = .white
        }else {
            view.backgroundColor = .red
        }
        try! MyRealm.write {
            MyRealm.create(Seat.self, value: (seatNum).self,update: true)
        }
        GETSAVEDDATAS()
    }
    @IBAction func bookSeat(_ sender: Any) {
        let navigate = UIStoryboard.init(name:"Main", bundle: nil)
        let tessyt = navigate.instantiateViewController(withIdentifier: "Success") as! Success
        self.navigationController?.pushViewController(tessyt, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
