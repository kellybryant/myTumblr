//
//  SignInViewController.swift
//  myTumblr
//
//  Created by Kelly Bryant on 6/10/16.
//  Copyright © 2016 Kelly Bryant. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var formParentView: UIView!
    var initialY: CGFloat!
    var offset: CGFloat!
    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var cancelBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        
            initialY = formParentView.frame.origin.y
            offset = 0
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressCancel(sender: AnyObject) {
        
        view.endEditing(true)
        dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        formParentView.frame.origin.y = initialY + offset
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        formParentView.frame.origin.y = initialY
        
    }


}
