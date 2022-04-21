//
//  ViewController.swift
//  Learn_Swift
//
//  Created by 선민재 on 2022/04/15.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let field = UITextField()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var models = [TodoList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        getAllItem()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.todo
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = models[indexPath.row]
        let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            
        }))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            self.deleteItem(item: item)
        }))
        
        present(sheet, animated: true)
    }
    
    @IBAction func tapAdd(_sender: UIBarButtonItem){
        let alert = UIAlertController(title: nil, message: "Please enter your todo", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        alert.addTextField { (textField) in
            self.field.placeholder = "enter"
            
        }
        
        alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                return
            }
            
            self?.createItem(todo: text)
            
        }))
        
        self.present(alert, animated: true)
    }
    
    func getAllItem() {
        do {
            models = try context.fetch(TodoList.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            // error
        }
        
    }
    
    func createItem(todo: String) {
        let newitem = TodoList(context: context)
        newitem.todo = todo
        newitem.date = Date()
        
        
        do{
            try context.save()
            getAllItem()
        }
        catch{
            
        }
    }
    
    func deleteItem(item: TodoList) {
        
        context.delete(item)
        
        do{
            try context.save()
        }
        catch{
            
        }
        
    }
    
    func updateItem(item: TodoList, newtodo: String) {
        item.todo = newtodo
        
        do{
            try context.save()
        }
        catch{
            
        }
    }

}
