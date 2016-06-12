//
//  TabBarViewViewController.swift
//  myTumblr
//
//  Created by Kelly Bryant on 6/7/16.
//  Copyright © 2016 Kelly Bryant. All rights reserved.
//

import UIKit

class TabBarViewViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var bubbleImage: UIImageView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!

    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    var composeViewController: UIViewController!
    
    var fadeTransition: FadeTransition!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(selectedIndex)
       // print(viewControllers)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeStoryboard")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchStoryboard")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountStoryboard")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingStoryboard")
        
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
        onSearchButton(buttons[selectedIndex])
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressTab(sender: UIButton) {
        
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        print(previousIndex)
        
        //select previous vc and remove it
        buttons[previousIndex].selected = false
        
        //getting wrapping optional value error
        let previousVC = viewControllers[previousIndex]

        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        
        //create vc of newly selected state
        sender.selected = true
        let vc = viewControllers[selectedIndex]
        addChildViewController(vc)
        //adjust the contents
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
        
        onSearchButton(buttons[selectedIndex])
        
    }

    func onSearchButton(sender:UIButton){
        print("in search")
        
        if selectedIndex == 1{
            //hide bubble
            bubbleImage.hidden = true
            
            
        } else {
            //show bubble and make it bounce
            bubbleImage.hidden = false
            
            UIView.animateWithDuration(0.8, delay: 0.0,
                // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
                options: [UIViewAnimationOptions.Autoreverse,
                    UIViewAnimationOptions.Repeat], animations: { () -> Void in
                        self.bubbleImage.transform = CGAffineTransformMakeTranslation(0, 10)
                }, completion: nil)
            
        }
        
        
    }
    
    
    

   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        var destinationViewController = segue.destinationViewController
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.6

    }
    

    
    

}
