//
//  ViewController.swift
//  Segues
//
//  Created by lily on 7/5/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func experiment() {
        
        let nextController = UIAlertController()
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { action in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        nextController.addAction(okAction)
        self.presentViewController(nextController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }



}

