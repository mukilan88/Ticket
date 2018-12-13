//
//  MovieTableList.swift
//  Ticket
//
//  Created by Mukil on 03/12/18.
//  Copyright © 2018 Class. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import RealmSwift

class MovieTableList: UIViewController, UITableViewDataSource{
    
    var tableList : [JSON] = []
    
    @IBOutlet var mainTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTable.dataSource = self
        Alamofire.request("https://jsonplaceholder.typicode.com/users").responseJSON{
            response in
//            print(response)
            let JSONValue = JSON(response.result.value ?? "")
            self.tableList = JSONValue.arrayValue
            self.mainTable.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableCell") as! MovieTableCell
        let dict = self.tableList[indexPath.row]
        cell.Name.text = dict["name"].stringValue
        cell.UName.text = dict["username"].stringValue
        cell.email.text = dict["website"].stringValue
        return cell
    }
}
