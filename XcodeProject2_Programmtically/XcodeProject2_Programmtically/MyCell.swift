//
//  MyCell.swift
//  XcodeProject2_Programmtically
//
//  Created by Briana Berger on 7/3/18.
//  Copyright © 2018 Briana Berger. All rights reserved.
//

import Foundation
import UIKit

class MyCell: UITableViewCell {
    private var state = false
    //sets up the table view by overiding and reintializing here
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //sets up the nameLabel as an UILabel
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage( #imageLiteral(resourceName: "checkBoxOUTLINE"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupViews() {
        //sets up the name label to be on screen
        
        addSubview(nameLabel)
        addSubview(actionButton)
        
        actionButton.addTarget(self, action: #selector(handleAction), for: .touchUpInside)
        
        //adds horizontal constraints
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v1(80)]-8-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel, "v1" : actionButton]))
        
        //adds vertical constraints
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-15-[v0]-15-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": actionButton]))
    }
    
    //purpose is to go back to ViewController and edit the action there
    @objc func handleAction() {
        if state == false {
            state = true
            actionButton.setBackgroundImage( #imageLiteral(resourceName: "checkBoxFILLED "), for: UIControlState.normal)
        } else {
            state = false
            actionButton.setBackgroundImage( #imageLiteral(resourceName: "checkBoxOUTLINE"), for: UIControlState.normal)
        }
        
    }
}
