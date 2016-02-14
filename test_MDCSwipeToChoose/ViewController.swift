//
//  ViewController.swift
//  test_MDCSwipeToChoose
//
//  Created by 荒川陸 on 2016/02/14.
//  Copyright © 2016年 riku_arakawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // You can customize MDCSwipeToChooseView using MDCSwipeToChooseViewOptions.
        let options:MDCSwipeToChooseViewOptions = MDCSwipeToChooseViewOptions()
        //options.delegate! = self
        options.likedText = "Keep"
        options.likedColor = UIColor.blueColor()
        options.nopeText = "Delete"
        options.onPan = { state -> Void in
            if (state.thresholdRatio == 1.0 && state.direction == MDCSwipeDirection.Left) {
                print("Let go now to delete the photo!")
   
            }
        }
        
        let view:MDCSwipeToChooseView = MDCSwipeToChooseView(frame:self.view.bounds, options:options)
        view.imageView.image = UIImage(named:"photo.jpg")
        self.view.addSubview(view)
    }
    
    // MDCSwipeToChooseDelegate Callbacks
    
    // This is called when a user didn't fully swipe left or right.
    func viewDidCancelSwipe(view: UIView) -> Void{
        print("Couldn't decide, huh?")
    }
    
    // Sent before a choice is made. Cancel the choice by returning `false`. Otherwise return `true`.
    func view(view:UIView, shouldBeChosenWithDirection:MDCSwipeDirection) -> Bool {
        if (shouldBeChosenWithDirection == MDCSwipeDirection.Left) {
            return true;
        } else {
            // Snap the view back and cancel the choice.
            UIView.animateWithDuration(0.16, animations: { () -> Void in
                view.transform = CGAffineTransformIdentity
                view.center = self.view.center
            })
            return false;
        }
    }
    
    // This is called then a user swipes the view fully left or right.
    func view(view: UIView, wasChosenWithDirection: MDCSwipeDirection) -> Void{
        if (wasChosenWithDirection == MDCSwipeDirection.Left) {
            print("Photo deleted!");
        } else {
            print("Photo saved!");
        }
    }}

