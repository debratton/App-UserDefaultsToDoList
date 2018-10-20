//
//  SecondViewController.swift
//  ToDoList
//
//  Created by David E Bratton on 10/20/18.
//  Copyright © 2018 David Bratton. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func addBtnPressed(_ sender: Any) {
        // items will be an array
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        var items:[String]
        
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            items.append(itemText.text!)
        } else {
            items = [itemText.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        itemText.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
