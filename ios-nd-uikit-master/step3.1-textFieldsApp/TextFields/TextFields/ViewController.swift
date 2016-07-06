//
//  ViewController.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var editingSwitch: UISwitch!
    
    
    // Text Field Delegate objects
    let numericDelegate = NumericalDelegate()
    let cashDelegate = CashTextFieldDelegate()
    // let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    
    // Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set the label to be hidden
        self.characterCountLabel.hidden = true
        
        // Set the three delegates
        self.textField1.delegate = numericDelegate
        self.textField2.delegate = cashDelegate
        self.textField3.delegate = self
        
        self.editingSwitch.setOn(false, animated: false)
    }

    
    // Text Field Delegate Methods
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return self.editingSwitch.on
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func toggleTextEditor(sender: AnyObject) {
        if !(sender as! UISwitch).on {
            textField3.resignFirstResponder()
        }
    }
    
}

