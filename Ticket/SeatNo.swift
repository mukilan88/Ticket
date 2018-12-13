//
//  SeatNo.swift
//  Ticket
//
//  Created by AruniOS on 12/12/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit

class SeatNo: UIViewController {

    var selectSeatOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let mybutton = UIButton()
//        mybutton.addTarget(self, action: #selector(seatNumber), for: .touchUpInside)
//        mybutton.setTitle("seatNumber", for: .normal)
//        mybutton.backgroundColor = UIColor.green
        // Do any additional setup after loading the view.
    }
    
    @IBAction func seatNumber(_ sender: UIButton) {
        selectSeatOn = !selectSeatOn
        if selectSeatOn{
            seatNumber(tag-1).backgroundColor = .white
        }else {
            view.backgroundColor = .red
        }
        print("click")
        //self.seatNumber.backgroundColor = UIColor.red
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
