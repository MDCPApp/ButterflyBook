//
//  CollectionGridViewController.swift
//  Parstagram
//
//  Created by Shaina Sweeney on 11/15/21.
//

import UIKit

class CollectionGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //something
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //something
        //let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SavedCollectionCell", for: indexPath) as! SavedCollectionCell
        return cell
    }

}
