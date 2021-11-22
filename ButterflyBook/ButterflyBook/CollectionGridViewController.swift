//
//  CollectionGridViewController.swift
//  Parstagram
//
//  Created by Shaina Sweeney on 11/15/21.
//

import UIKit
import Parse
import AlamofireImage

class CollectionGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    

    @IBOutlet weak var collectionView: UICollectionView!
    var nolos = [PFObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"Nolo")
        query.includeKey("proPic")
        query.limit = 20
        
        query.findObjectsInBackground { (nolos, error) in
            if nolos != nil {
                self.nolos = nolos!
                self.collectionView.reloadData()
            }
            
        }
    }
  
    
    
    //required funcs
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //something
        return nolos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //something
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SavedCollectionCell", for: indexPath) as! SavedCollectionCell
        
        let nolo = nolos[indexPath.row]
        
        let imageFile = nolo["proPic"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
    
        cell.profileView.af_setImage(withURL: url)
        
        
        return cell
    }

}
