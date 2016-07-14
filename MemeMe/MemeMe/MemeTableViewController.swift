//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by lily on 7/10/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import UIKit

class MemeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var memeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // using the shared model
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MemeTableViewCell
        let meme = memes[indexPath.row]
        cell.cellImage.image = meme.memedImage
        cell.cellLabel.text = "\(meme.topText!)...\(meme.bottomText!)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let memeDetailVC = storyboard!.instantiateViewControllerWithIdentifier("MemeDetail") as! MemeDetailViewController
        memeDetailVC.meme = memes[indexPath.row]
        navigationController?.pushViewController(memeDetailVC, animated: true)
    }
    
    func deleteRowsAtIndexPaths(_indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
        
    }

}
