//
//  ViewController.swift
//  User defaults
//
//  Created by leon on 2018/10/3.
//  Copyright © 2018年 leonlee. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let defaults = UserDefaults.standard

    var listArray = [String]()
    
    var dataToPass : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       view.backgroundColor = .green
        
        navigationItem.title = "MyListArray"
    
        if let items = defaults.array(forKey: "myListArray") as? [String]{
            listArray = items
        }
        
        
        tableView.reloadData()
        
    }

    
    //Mark-Tableview data sourse method
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listArray[indexPath.row]
        return cell
    }
    
    //Mark-Tableview delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(listArray[indexPath.row])
        dataToPass = listArray[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.dataPassOver = dataToPass
        }
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "add", message: "Would you want to add some items to the list?", preferredStyle: .alert)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter the text"
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Sure", style: .default) { (action) in
            print(textField.text)
            
            self.listArray.append(textField.text!)
            
            self.defaults.set(self.listArray, forKey: "myListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    

}

