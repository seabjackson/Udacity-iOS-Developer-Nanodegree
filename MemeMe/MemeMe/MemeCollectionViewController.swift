//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by lily on 7/10/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import UIKit

 private let reuseIdentifier = "CollectionCell"

class MemeCollectionViewController: UICollectionViewController {
    
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    // using the shared model
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        changeFlowLayoutFor(view.frame.size)
        
    }
    
    func changeFlowLayoutFor(size: CGSize) {
        let spacing: CGFloat = 1.0
        let dimension: CGFloat = size.width > size.height ? (size.width - (5 * spacing)) / 6.0 : (size.width - (2 * spacing)) / 3.0
        
        flowLayout.minimumInteritemSpacing = spacing
        flowLayout.minimumLineSpacing = spacing
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        changeFlowLayoutFor(size)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        collectionView?.reloadData()
    }


    // MARK: UICollectionViewDataSource




    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return memes.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MemeCollectionViewCell
        let meme = memes[indexPath.item]
        cell.imageView.image = meme.memedImage
//        cell.topLabel.text = meme.topText
//        cell.bottomLabel.text = meme.bottomText
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let memeDetailVC = storyboard!.instantiateViewControllerWithIdentifier("MemeDetail") as! MemeDetailViewController
        memeDetailVC.meme = memes[indexPath.item]
        navigationController?.pushViewController(memeDetailVC, animated: true)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
