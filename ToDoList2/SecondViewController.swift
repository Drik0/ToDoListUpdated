//
//  SecondViewController.swift
//  ToDoList2
//
//  Created by Gerson Costa on 26/11/2017.
//  Copyright © 2017 Gerson Costa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addedTask: UITextField!
    
    @IBOutlet weak var confirmationLabel: UILabel!
    
    var timer = Timer()
    
    var countDown: Int = 0
    
    var listArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addedTask.delegate = self
        let savedObj = UserDefaults.standard.object(forKey: "ToDoList")
        if let savedArray = savedObj as? NSArray {
            listArray = savedArray as! [String] 
        }
    }

    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        if let task = addedTask.text {
            listArray.append(task)
            UserDefaults.standard.set(listArray, forKey: "ToDoList")
            confirmationLabel.text = "\(task) was added to the list"
            confirmationLabel.isHidden = false
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SecondViewController.showMessage), userInfo: nil, repeats: true)
            addedTask.text = ""
        }
    }
    
    @objc func showMessage() {
        countDown += 1
        if countDown == 5 {
            confirmationLabel.isHidden = true
            timer.invalidate()
            countDown = 0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

