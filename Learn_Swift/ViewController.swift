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
    
    let container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    lazy var context = container.viewContext
    lazy var tasks = TodoList(context: context)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TodoList"
    }
    
    
    @IBAction func tapAdd(_sender: UIBarButtonItem){
        let alert = UIAlertController(title: nil, message: "Please enter your todo", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField { (textField) in
            self.field.placeholder = "enter"
            
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [self] action in
            
            self.tasks.todo = alert.textFields?[0].text ?? .init()
            print("tasks: \(self.tasks.todo)")
            
            //self.itemArray.append(tasks)
            
        }))
        
        self.present(alert, animated: true)
    }

}
