//
//  Home.swift
//  Ticket
//
//  Created by Mukil on 28/11/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit
import FSPagerView

class Home: UIViewController, FSPagerViewDelegate, FSPagerViewDataSource{
    
    @IBOutlet var mMovie: UILabel!
    @IBOutlet var MovieSL: UIImageView!
    /********************adimage***************************/
    @IBOutlet weak var slideView: FSPagerView!{
    didSet {
    self.slideView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        self.slideView.transformer = FSPagerViewTransformer(type: .coverFlow)
        self.slideView.itemSize = CGSize(width: 250, height: 250)
        self.slideView.automaticSlidingInterval = 2
        
    }
}
    var tablelist = [#imageLiteral(resourceName: "sarkar"), #imageLiteral(resourceName: "Smarther-Logo"), #imageLiteral(resourceName: "LanchImage"), #imageLiteral(resourceName: "Smarther-Logo"), #imageLiteral(resourceName: "sarkar")]
    /********************adimage*****************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        /********************adimage***************************/

        slideView.dataSource = self
        slideView.reloadData()

        /********************adimage***************************/
        let tap = UITapGestureRecognizer.init(target: self, action: #selector (TapMovie))
        mMovie.isUserInteractionEnabled = true
        mMovie.addGestureRecognizer(tap)
        
        let imgTap = UITapGestureRecognizer.init(target: self, action: #selector(ImgTaped))
        MovieSL.isUserInteractionEnabled = true
        MovieSL.addGestureRecognizer(imgTap)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /********************adimage*****************************/
     func numberOfItems(in pagerView: FSPagerView) -> Int {
            return self.tablelist.count
    }
    
     func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        cell.imageView?.image = self.tablelist[index]
        return cell
    }
    /********************adimage*****************************/
    @objc func TapMovie() {
        print("tap working")
        let navigate = UIStoryboard.init(name:"Main", bundle: nil)
        let tessyt = navigate.instantiateViewController(withIdentifier: "MovieTableList") as! MovieTableList
        self.navigationController?.pushViewController(tessyt, animated: true)
    }
    @objc func ImgTaped(){
        let navigate = UIStoryboard.init(name:"Main", bundle: nil)
        let tessyt = navigate.instantiateViewController(withIdentifier: "AboutMovie") as! AboutMovie
        self.navigationController?.pushViewController(tessyt, animated: true)
        print("img taped")
    }
}
