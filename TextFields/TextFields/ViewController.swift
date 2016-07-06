//
//  ViewController.swift
//  TextFields
//
//  Created by lily on 7/5/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = randomColorDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let randomColorDelegate = RandomColorTextFieldDelegate()
    
    
}

