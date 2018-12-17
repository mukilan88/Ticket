//
//  AboutMovie.swift
//  Ticket
//
//  Created by Mukil on 03/12/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit
import YouTubePlayer

class AboutMovie: UIViewController {


    @IBOutlet weak var videoView: YouTubePlayerView!
    
    @IBOutlet var likeLable: UILabel!
    var score : Int = 0
    var i = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //video id from youtube
        videoView.loadVideoID("jrETX2eDhL8")
    }

    @IBAction func like(_ sender: UIButton) {
        let output = score
        score = score + 1
        likeLable.text = "\(output)"
    }    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
