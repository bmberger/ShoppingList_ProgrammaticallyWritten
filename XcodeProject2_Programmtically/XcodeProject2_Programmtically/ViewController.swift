//
//  ViewController.swift
//  XcodeProject2_Programmtically
//
//  Created by Briana Berger on 7/3/18.
//  Copyright © 2018 Briana Berger. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, AddItemDelegate {

    var items = ["Bread", "Milk", "Bananas", "Blueberries", "Tea"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Shopping List"
        
        //allows us to create an identifier
        tableView.register(MyCell.self, forCellReuseIdentifier: "cellId")
        
        setupViews()
        
    }
    
    func setupViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewView))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //Returns a reusable table-view cell object located by its identifier in the items array (defined at top)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MyCell
        MyCell.nameLabel.text = items[indexPath.row]
        return MyCell
    }
    
    //allows us to go over to the new view controller with hitting '+'
    @objc func addNewView() {
        let addItemViewController = AddItemViewController()
        addItemViewController.delegate = self
        navigationController?.pushViewController(addItemViewController, animated: true)
    }
    
    //this method adds whatever item is added in AddItemViewController
    func addItem(item: String) {
        items.append(item)
        tableView.reloadData()
    }    
}

