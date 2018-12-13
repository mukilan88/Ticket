//
//  Book.swift
//  Ticket
//
//  Created by Mukil on 28/11/18.
//  Copyright © 2018 Class. All rights reserved.
//

//import UIKit
//import Realm
//import RealmSwift
//
//class Book: UIViewController {
//   
//    @IBOutlet weak var bookView: UIView!
//    @IBOutlet weak var seatNo: UILabel!
//    
////    var SavedSeat: Results<Module>!
////    var i = 0
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let tapSeat = UITapGestureRecognizer.init(target: self, action: #selector (Select))
//        seatNo.isUserInteractionEnabled = true
//        seatNo.addGestureRecognizer(tapSeat)
//        
//        let tapView = UITapGestureRecognizer.init(target: self, action: #selector (SelectView))
//        bookView.isUserInteractionEnabled = true
//        bookView.addGestureRecognizer(tapView)
////        GETDAVEDDATAS()
//    }
////    func GETDAVEDDATAS(){
////       SavedSeat = MyRealm.objects(Module.self)
////        while i<SavedSeat.count{
////            print("SAVED>>>>>>  ",SavedSeat[i].seatNo ?? "")
////            i = i+1
////        }
////    }
//    @IBAction func fBook(_ sender: Any) {
////        try! MyRealm.write{
////            MyRealm.create(Module.self, value: ["seatNumber" : "/(seatNo)"],update: true)
////        }
//        self.seatNo.text = ""
//        let navigate = UIStoryboard.init(name:"Main", bundle: nil)
//        let bookingpage = navigate.instantiateViewController(withIdentifier: "Success") as! Success
//        self.navigationController?.pushViewController(bookingpage, animated: true)
////        GETDAVEDDATAS()
//   }
//    @objc func SelectView() {
//        self.bookView.backgroundColor = UIColor.red
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    @objc func Select() {
//        print(seatNo)
//    }
//}

