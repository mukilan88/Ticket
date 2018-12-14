//
//  AboutMovie.swift
//  Ticket
//
//  Created by Mukil on 03/12/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit

class AboutMovie: UIViewController {

    @IBOutlet var likeLable: UILabel!
    var score : Int = 0
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func like(_ sender: UIButton) {
        let output = score
        score = score + 1
        likeLable.text = "\(output)"
    }
    
    @IBAction func book(_ sender: UIButton) {
//        let navigate = UIStoryboard.init(name:"Main", bundle: nil)
//        let bookingpage = navigate.instantiateViewController(withIdentifier: "SeatNo") as! SeatNo
//        self.navigationController?.pushViewController(bookingpage, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
