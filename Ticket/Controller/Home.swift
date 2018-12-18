//
//  Home.swift
//  Ticket
//
//  Created by Mukil on 28/11/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit
import FSPagerView
import RealmSwift
import Realm
import Kingfisher

class Home: UIViewController, FSPagerViewDelegate, FSPagerViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource{
    
    //Variable given for movie in the to menu
    @IBOutlet var theaterList: UILabel!
    //Variable given to image for slide show it only work with the help of FSPagerViw cocopod
    var tablelist = [#imageLiteral(resourceName: "sarkar"), #imageLiteral(resourceName: "Smarther-Logo"), #imageLiteral(resourceName: "LanchImage"), #imageLiteral(resourceName: "Smarther-Logo"), #imageLiteral(resourceName: "sarkar")]
    //MARK:- slideView input the image cell and time
    @IBOutlet weak var slideView: FSPagerView!{
        didSet {
            self.slideView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.slideView.transformer = FSPagerViewTransformer(type: .coverFlow)
            self.slideView.itemSize = CGSize(width: 250, height: 250)
            self.slideView.automaticSlidingInterval = 2
                }
    }
    //MARK:- outlet for movie collection View
    @IBOutlet weak var movieCollViewList: UICollectionView!
    //MARK:- collection of movie
    var movieCollection : Results<Movie>!
    //Over write the screen code as we want
    override func viewDidLoad() {
        super.viewDidLoad()
        //movie collection
        try! MyRealm.write {
            MyRealm.create(Movie.self, value: ["movieID":"1","theaterID":["1","3","5"],"movieNameRealm":"2.0","movieImgRealm":"https://www.hindustantimes.com/rf/image_size_960x540/HT/p2/2018/09/13/Pictures/_c4607032-b705-11e8-ab60-f008577e130d.JPG","movieRatingRealm":8], update: true)
            MyRealm.create(Movie.self, value: ["movieID":"2","theaterID":["2","4","6"],"movieNameRealm":"Sarkar","movieImgRealm":"https://www.thenewsminute.com/sites/default/files/styles/news_detail/public/vijay_sarkar_DN_750.jpg?itok=9tGu7SD6","movieRatingRealm":7], update: true)
            MyRealm.create(Movie.self, value: ["movieID":"3","theaterID":["7","9","5"],"movieNameRealm":"ThuppakkiMunai","movieImgRealm":"https://www.onlykollywood.com/wp-content/uploads/2018/12/thuppakki-munai-movie-review.jpg","movieRatingRealm":4], update: true)
            MyRealm.create(Movie.self, value: ["movieID":"4","theaterID":["4","6","8"],"movieNameRealm":"Johnny","movieImgRealm":"https://i.ytimg.com/vi/_rF9emhWjiU/maxresdefault.jpg","movieRatingRealm":3], update: true)
            MyRealm.create(Movie.self, value: ["movieID":"5","theaterID":["2","10","1"],"movieNameRealm":"Raatchasan","movieImgRealm":"https://i.ytimg.com/vi/hc7HlQVXnbM/maxresdefault.jpg","movieRatingRealm":10], update: true)
        }
        movieCollection = MyRealm.objects(Movie.self)
        movieCollViewList.dataSource = self
        movieCollViewList.delegate = self
        movieCollViewList.reloadData()
//        print(movieCollection)will print the movielist in the database list
        //Slide show image to show in the screen "slideView - Var Name from var given" "dataSource - data getting from fun"
        slideView.dataSource = self
        slideView.reloadData()
        //MARK: - tap function to work whn we touch the Movies in top menu item
        let tap = UITapGestureRecognizer.init(target: self, action: #selector (TapMovie))
        theaterList.isUserInteractionEnabled = true
        theaterList.addGestureRecognizer(tap)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //TODO:- function to view the image collection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieCollection.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dict = self.movieCollection[indexPath.row]
        print(">>>>>>",dict.theaterID)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieViewCell", for: indexPath) as! MovieViewCell
        let url = URL.init(string: dict.movieImgRealm ?? "")
        cell.movieImgCell?.kf.setImage(with: url)
        cell.movieRateCell.text = String(dict.movieRatingRealm)
        cell.movieNameCell.text = dict.movieNameRealm ?? ""
        return cell
    }
    //TODO:- function for the image slideView
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
    //TODO:- function for the tap the Movie lable go to movie list
    @objc func TapMovie() {
        print("tap working")
        let navigate = UIStoryboard.init(name:"Main", bundle: nil)
        let tessyt = navigate.instantiateViewController(withIdentifier: "TheaterTableList") as! TheaterTableList
        self.navigationController?.pushViewController(tessyt, animated: true)
    }
    //TODO:- function for the tap the Image in collection view
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let navigate = UIStoryboard.init(name:"Main", bundle: nil)
        let tessyt = navigate.instantiateViewController(withIdentifier: "AboutMovie") as! AboutMovie
        self.navigationController?.pushViewController(tessyt, animated: true)
        print("img taped")
    }
}
