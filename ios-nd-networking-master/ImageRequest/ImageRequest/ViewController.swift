//
//  ViewController.swift
//  ImageRequest
//
//  Created by Jarrod Parkes on 11/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageUrl = NSURL(string: "http://colorlisa.com/pictures/159_1.jpg")
        //NSURLSession.sharedSession() // this is a singleton as it can only be instantiated once.
        let task = NSURLSession.sharedSession().dataTaskWithURL(imageUrl!)  { (data, response, error) in
            if error == nil {
                let downloadedImage = UIImage(data: data!)
                performUIUpdatesOnMain {
                    self.imageView.image = downloadedImage
                }
            }
        }
        task.resume()
        
        
        
        
        // TODO: Add all the networking code here!
    }
}
