//
//  FirstViewController.swift
//  ToDoList2
//
//  Created by Gerson Costa on 26/11/2017.
//  Copyright © 2017 Gerson Costa. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = listArray[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var table: UITableView!
    
    var listArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
        table.reloadData()
    }
    
    func getData() {
        let savedObj = UserDefaults.standard.object(forKey: "ToDoList")
        if let savedArray = savedObj as? NSArray {
            listArray = savedArray as! [String]
        }
    }
        

}

