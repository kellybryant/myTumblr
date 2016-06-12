//
//  SearchViewController.swift
//  myTumblr
//
//  Created by Kelly Bryant on 6/8/16.
//  Copyright © 2016 Kelly Bryant. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var loaderImage: UIImageView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var loaderImageView: UIView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    
    var images: [UIImage]!
    var animatedImage: UIImage!



    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        
        images = [loading_1, loading_2, loading_3]
        
        animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)
        loaderImage.image = animatedImage



        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        searchImageView.hidden = true
        loaderImageView.hidden = false
       
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        func delay(delay:Double, closure:()->()) {
            dispatch_after(
                dispatch_time(
                    DISPATCH_TIME_NOW,
                    Int64(delay * Double(NSEC_PER_SEC))
                ),
                dispatch_get_main_queue(), closure)
        }
        
        // Delay for 2 seconds, then run the code between the braces.
        delay(2) {
            self.searchImageView.hidden = false
            self.loaderImageView.hidden = true
            
            
            
            
        }
        
        
    }

}
