//
//  ViewController.swift
//  Learn_Swift
//
//  Created by 선민재 on 2022/04/15.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    let realm = try! Realm()
    //let tasks = TodoList

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TodoList"
    }
    
    @IBAction func tapAdd(_sender: UIBarButtonItem){
        let alert = UIAlertController(title: "TodoList", message: "Please enter your to-do", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField { (textField) in
            textField.placeholder = "enter"
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { action in
            
        }))
        
        self.present(alert, animated: true)
    }

}


class TodoList: Object{
    @Persisted var task:String = ""
}
