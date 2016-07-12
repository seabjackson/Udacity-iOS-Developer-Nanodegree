//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by lily on 7/12/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var meme: Meme!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        if let memedImage = meme.memedImage {
            imageView.image = memedImage
        }
        
    }

    
}
