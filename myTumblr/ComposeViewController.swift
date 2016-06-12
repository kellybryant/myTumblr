//
//  ComposeViewController.swift
//  myTumblr
//
//  Created by Kelly Bryant on 6/8/16.
//  Copyright © 2016 Kelly Bryant. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textImage: UIImageView!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var quoteImage: UIImageView!
    @IBOutlet weak var linkImage: UIImageView!
    @IBOutlet weak var chatImage: UIImageView!
    @IBOutlet weak var videoImage: UIImageView!
    
    var yOneOrigin: CGFloat!
    var yTwoOrigin: CGFloat!
    var yOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yOneOrigin = textImage.frame.origin.y
        yTwoOrigin = linkImage.frame.origin.y
        yOffset = view.frame.height
        print(yOneOrigin)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressNevermind(sender: UIButton) {
        UIView.animateWithDuration(0.6, delay: 0.2,
            options: [], animations: { () -> Void in
                self.photoImage.frame.origin.y -= self.yOffset
            }, completion: { (Bool) -> Void in
        })
        UIView.animateWithDuration(0.4, delay: 0.4,
            options: [], animations: { () -> Void in
                self.chatImage.frame.origin.y -= self.yOffset
            }, completion: { (Bool) -> Void in
        })
        
        UIView.animateWithDuration(0.6, delay: 0.6,
            options: [], animations: { () -> Void in
                self.quoteImage.frame.origin.y -= self.yOffset
            }, completion: { (Bool) -> Void in
        })
        UIView.animateWithDuration(0.4, delay: 0.8,
            options: [], animations: { () -> Void in
                self.textImage.frame.origin.y -= self.yOffset
            }, completion: { (Bool) -> Void in
        })
        UIView.animateWithDuration(0.4, delay: 1.0,
            options: [], animations: { () -> Void in
                self.linkImage.frame.origin.y -= self.yOffset
            }, completion: { (Bool) -> Void in
        })
        UIView.animateWithDuration(0.4, delay: 1.2,
            options: [], animations: { () -> Void in
                self.videoImage.frame.origin.y -= self.yOffset
            }, completion: { (Bool) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
        })

    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //icons start hidden
        textImage.frame.origin.y += yOffset
        photoImage.frame.origin.y += yOffset
        quoteImage.frame.origin.y += yOffset
        linkImage.frame.origin.y += yOffset
        chatImage.frame.origin.y += yOffset
        videoImage.frame.origin.y += yOffset
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //show icons
        UIView.animateWithDuration(0.6, delay: 0.2,
            options: [], animations: { () -> Void in
                self.photoImage.frame.origin.y = self.yOneOrigin
            }, completion: { (Bool) -> Void in
        })
        
        UIView.animateWithDuration(0.4, delay: 0.4,
            options: [], animations: { () -> Void in
                self.chatImage.frame.origin.y = self.yTwoOrigin
            }, completion: { (Bool) -> Void in
        })
        
        UIView.animateWithDuration(0.6, delay: 0.6,
            options: [], animations: { () -> Void in
                self.quoteImage.frame.origin.y = self.yOneOrigin
            }, completion: { (Bool) -> Void in
        })
        UIView.animateWithDuration(0.4, delay: 0.8,
            options: [], animations: { () -> Void in
                self.textImage.frame.origin.y = self.yOneOrigin
            }, completion: { (Bool) -> Void in
        })
        UIView.animateWithDuration(0.4, delay: 1.0,
            options: [], animations: { () -> Void in
                self.linkImage.frame.origin.y = self.yTwoOrigin
            }, completion: { (Bool) -> Void in
        })
        UIView.animateWithDuration(0.4, delay: 1.2,
            options: [], animations: { () -> Void in
                self.videoImage.frame.origin.y = self.yTwoOrigin
            }, completion: { (Bool) -> Void in
        })
        
        
    }


}
