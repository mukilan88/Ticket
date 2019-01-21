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

class SeatSelect: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var amount: UILabel!
    @IBOutlet var seatNumTotal: UILabel!
    @IBOutlet var bookFinal: UIButton!
    @IBOutlet weak var seatNoCollection: UICollectionView!
    var seatNo : Results<Seat>!
    var bookedSeat : String?

    var available_cout = 0
    var i = 0
    
    var seatTotal = 0
    var s = 0
    var cost = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Realm DB input of Seat Number
        
        while i < 20
        {
            if available_cout <= i
            {
                try! MyRealm.write
                {
                    MyRealm.create(Seat.self, value: ["seatNumRealm":"A1","seatNumID":String(i),"isBookedRealm":1], update:true)
                }
            }
            else
            {
                try! MyRealm.write
                {
                    MyRealm.create(Seat.self, value: ["seatNumRealm":"A1","seatNumID":String(i),"isBookedRealm":0], update:true)
                }
            }
            i = i + 1
        }
        
        seatNo = MyRealm.objects(Seat.self)
        seatNoCollection.dataSource = self
        seatNoCollection.delegate = self
        seatNoCollection.reloadData()
        
        //MARK: - tap function to work whn we touch the Movies in top menu item
        let tap = UITapGestureRecognizer.init(target: self, action: #selector (bookLabel))
        bookFinal.isUserInteractionEnabled = true
        bookFinal.addGestureRecognizer(tap)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.seatNo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"SeatNoCell", for: indexPath) as! SeatNoCell
        let dict = self.seatNo[indexPath.row]
        
        if dict.isBookedRealm == 1{
            cell.seatNoCell.backgroundColor = UIColor.red
        }else{
            cell.seatNoCell.backgroundColor = UIColor.clear
        }
        
        cell.seatNoCell.text = dict.seatNumRealm ?? ""
        
        //MARK: - tap function
        let tap = UITapGestureRecognizer.init(target: self, action: #selector (TapSeat))
        cell.seatNoCell.isUserInteractionEnabled = true
        cell.seatNoCell.tag = indexPath.row
        cell.seatNoCell.addGestureRecognizer(tap)
        
        return cell
    }
    //Tap the seat
    @objc func TapSeat(sender:UITapGestureRecognizer) {
        
        let index = IndexPath.init(item: sender.view?.tag ?? 0, section: 0)
        
        let dict = self.seatNo[index.row]
        
        let cell = self.seatNoCollection.cellForItem(at: index) as! SeatNoCell
       
        if dict.isBookedRealm == 1
        {
            
            if cell.seatNoCell.backgroundColor == UIColor.red{
                
            }else{
                cell.seatNoCell.backgroundColor = UIColor.clear
                
                try! MyRealm.write
                {
                    MyRealm.create(Seat.self, value: ["seatNumRealm":"A1","seatNumID":dict.seatNumID ?? "","isBookedRealm":0], update:true)
                }
                if cell.seatNoCell.backgroundColor == UIColor.clear{
                    seatTotal = seatTotal - 1
                    seatNumTotal.text = "Seat Select : \(seatTotal)"
                }
                //TODO: - calculating the cost
                cost = seatTotal * 120
                amount.text = "Cost : \(cost)"
            }
        }
        else
        {
            cell.seatNoCell.backgroundColor = UIColor.green
            
            try! MyRealm.write
            {
                MyRealm.create(Seat.self, value: ["seatNumRealm":"A1","seatNumID":dict.seatNumID ?? "","isBookedRealm":1], update:true)
            }
            if cell.seatNoCell.backgroundColor == UIColor.green{
                
                seatTotal = seatTotal + 1
                seatNumTotal.text = "Seat Select : \(seatTotal)"
            }
            //TODO: - calculating the cost
            cost = seatTotal * 120
            amount.text = "Cost : \(cost)"
        }
    
    }
    //TODO:- function for the tap the Movie lable go to movie list
    @objc func bookLabel() {
        let navigate = UIStoryboard.init(name:"Main", bundle: nil)
        let tessyt = navigate.instantiateViewController(withIdentifier: "Success") as! Success
        self.navigationController?.pushViewController(tessyt, animated: true)
    }
}
