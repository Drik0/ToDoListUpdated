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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alert(task: listArray[indexPath.row])
            listArray.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(listArray, forKey: "ToDoList")
        }
    }
    
    func getData() {
        let savedObj = UserDefaults.standard.object(forKey: "ToDoList")
        if let savedArray = savedObj as? NSArray {
            listArray = savedArray as! [String]
        }
    }
    
    func alert(task: String) {
        let alert = UIAlertController(title: "Success", message: "\(task) was successfully removed from the list!", preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            print("Success") }
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }
}

