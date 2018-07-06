//
//  AddItemView.swift
//  XcodeProject2_Programmtically
//
//  Created by Briana Berger on 7/3/18.
//  Copyright © 2018 Briana Berger. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemDelegate {
    func addItem(item: String)
}

class AddItemViewController : UIViewController {
    
    //allows us to use the viewController and its methods in here
    var delegate: AddItemDelegate?
    
    let taskNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter item..."
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = UIColor.lightGray
        textField.borderStyle = UITextBorderStyle.line
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isHidden = false
        return textField
    }()
    
    let taskButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.blue
        button.setTitle("Done", for:UIControlState.normal)
        button.setTitleColor(UIColor.white, for:UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = UIColor.white
    }
    
    func setupViews() {
        //adds the views
        self.view.addSubview(taskNameTextField)
        self.view.addSubview(taskButton)
        
        //listener for button action touch
        taskButton.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        
        //adds horizontal constraints
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-100-[v0]-[v1(80)]-100-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": taskNameTextField, "v1": taskButton]))
        
        //adds vertical constraints
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-350-[v0]-350-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": taskNameTextField]))
         self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-350-[v0]-350-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": taskButton]))
    
    }
    
    //the function for when button is clicked
    @objc func addTask() {
        delegate?.addItem(item: taskNameTextField.text!)
        taskNameTextField.text = ""
        navigationController?.popViewController(animated: true)
    }
    
}
