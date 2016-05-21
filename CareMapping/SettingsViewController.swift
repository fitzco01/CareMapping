//
//  SettingsViewController.swift
//  CareMapping
//
//  Created by Connor Fitzpatrick on 5/20/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var brushLabel: UILabel!
    @IBOutlet weak var opacityLabel: UILabel!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var brushImage: UIImageView!
    @IBOutlet weak var opacityImage: UIImageView!
    
    @IBOutlet weak var brushSlider: UISlider!
    @IBOutlet weak var opacitySlider: UISlider!

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBAction func done(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    private struct Constants {
        static var brush: CGFloat = 10.0
        static var opacity: CGFloat = 1.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderChanges(sender: UISlider) {
        if sender == brushSlider {
            Constants.brush = CGFloat(sender.value)
            brushLabel.text = NSString(format: "%.2f", Constants.brush.native) as String
        } else {
            Constants.opacity = CGFloat(sender.value)
            opacityLabel.text = NSString(format: "%.2f", Constants.opacity.native) as String
        }
        
        drawPreview()
    }
    
    
    func drawPreview() {
        UIGraphicsBeginImageContext(brushImage.frame.size)
        var context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetLineWidth(context, Constants.brush)
        
        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0)
        CGContextMoveToPoint(context, 45.0, 45.0)
        CGContextAddLineToPoint(context, 45.0, 45.0)
        CGContextStrokePath(context)
        brushImage.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIGraphicsBeginImageContext(brushImage.frame.size)
        context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetLineWidth(context, 20)
        CGContextMoveToPoint(context, 45.0, 45.0)
        CGContextAddLineToPoint(context, 45.0, 45.0)
        
        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, Constants.opacity)
        CGContextStrokePath(context)
        opacityImage.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
//    func drawPreview() {
//        UIGraphicsBeginImageContext(brushImage.frame.size)
//        var context = UIGraphicsGetCurrentContext()
//        
//        CGContextSetLineCap(context, CGLineCap.Round)
//        CGContextSetLineWidth(context, Constants.brush)
//        
//        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0)
//        CGContextMoveToPoint(context, 45.0, 45.0)
//        CGContextAddLineToPoint(context, 45.0, 45.0)
//        CGContextStrokePath(context)
//        brushImage.image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        UIGraphicsBeginImageContext(brushImage.frame.size)
//        context = UIGraphicsGetCurrentContext()
//        
//        CGContextSetLineCap(context, CGLineCap.Round)
//        CGContextSetLineWidth(context, 20)
//        CGContextMoveToPoint(context, 45.0, 45.0)
//        CGContextAddLineToPoint(context, 45.0, 45.0)
//        
//        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, Constants.opacity)
//        CGContextStrokePath(context)
//        opacityImage.image = UIGraphicsGetImageFromCurrentImageContext()
//        
//        UIGraphicsEndImageContext()
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
