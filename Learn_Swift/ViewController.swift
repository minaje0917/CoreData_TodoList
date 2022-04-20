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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tapAdd(_sender: UIBarButtonItem){
        let alert = UIAlertController(title: nil, message: "Please enter your todo", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField { (textField) in
            self.field.placeholder = "enter"
            
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [self] action in
            
            //self.tasks.todo = alert.textFields?[0].text ?? .init()
            //print("tasks: \(self.tasks.todo)")
            
            //self.itemArray.append(tasks)
            
        }))
        
        self.present(alert, animated: true)
    }
    
    func getAllItem() {
        do {
            let items = try context.fetch(TodoList.fetchRequest())
        }
        catch{
            // error
        }
        
    }
    
    func createItem(name: String) {
        let newitem = TodoList(context: <#T##NSManagedObjectContext#>)
    }
    
    func deleteItem(item: TodoList) {
        
    }
    
    func updateItem(item: TodoList) {
        
    }

}
