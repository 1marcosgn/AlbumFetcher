//
//  ViewController.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let servicesImpl = ServicesImplementer.init()
        
        servicesImpl.fetchAlbums { (success) in
            
            if success {
                print("hey its working")
            } else {
                print("NOT WORKING!!")
            }
            
            
            
        }
        
    }


}

