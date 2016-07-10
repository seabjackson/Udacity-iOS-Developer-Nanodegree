//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by lily on 7/10/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit

class VillainDetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    var villain: Villain!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.label.text = self.villain.name
        self.imageView.image = UIImage(named: villain.imageName)
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
