//
//  ProfileViewController.swift
//  ButterflyBook
//
//  Created by Shaina Sweeney on 11/18/21.
//

import UIKit
import Parse
import AlamofireImage

class ProfileViewController: UIViewController {
    

    
    
    @IBOutlet weak var noloLabel: UILabel!
    var nolos = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className:"Nolo")
        query.includeKey("name")
        query.limit = 20
        
        query.findObjectsInBackground { (nolos, error) in
            if nolos != nil {
                self.nolos = nolos!
                self.reloadInputViews()
            }
            
        }
        
        noloLabel.text = "Bob Sweeney"
        
        
    }
    

    

}
