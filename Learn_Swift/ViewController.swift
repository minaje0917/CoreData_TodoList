//
//  ViewController.swift
//  Learn_Swift
//
//  Created by 선민재 on 2022/04/15.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let field = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TodoList"
    }
    
    
    @IBAction func tapAdd(_sender: UIBarButtonItem){
        let alert = UIAlertController(title: "TodoList", message: "Please enter your to-do", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField { (textField) in
            self.field.placeholder = "enter"
            
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { action in
            let container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
            let context = container.viewContext
            let tasks = TodoList(context: context)
            
            tasks.todo = self.field.text
            
            //self.itemArray.append(tasks)
        }))
        
        self.present(alert, animated: true)
    }

}
