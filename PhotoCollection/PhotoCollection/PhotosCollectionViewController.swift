//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Mitchell Budge on 5/2/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    //let themeHelper = ThemeHelper()
    
  
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoDetailSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController,
                let cell = sender as? PhotosCollectionViewController else { return }
            
        }
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
    
        let photo = photoController.photos[indexPath.item]
        cell.photoLabel.text = photo.title
        //cell.photoView.image = photo.imageData    Problem
    
        return cell
    }
    
    
    func setTheme() {
        guard let themePreference = ThemeHelper.themePreference else { return }
        
        if themePreference == "Dark" {
            view.backgroundColor = .black
            //PhotosCollectionViewController.setTheme()     Possible Problem :'(
            
        } else if themePreference == "Light" {
            view.backgroundColor = .lightGray
        }
        
    }
    
    
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
