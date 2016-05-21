//
//  FlowViewController.swift
//  CareMapping
//
//  Created by Connor Fitzpatrick on 5/20/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit
import SpriteKit

class FlowViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBAction func back(sender: UIBarButtonItem) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    var scrollView: UIScrollView!
    
    // MARK: - Constants
    
    private struct Constants {
        static var XCoor = 20
        static var YCoor = 20
        
        static var height = CGFloat(100)
        static var width = CGFloat(100)
    }
    
    // MARK: - Functions
    
    func buttonAction(sender:UIButton!)
    {
        print("Button tapped")
    }
    
    func createButton() -> UIButton {
        return UIButton(type: UIButtonType.System) as UIButton
    }
    
    func drawLineFromPoint(start: CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        
        //design the path
        let path = UIBezierPath()
        path.moveToPoint(start)
        path.addLineToPoint(end)
        
        //design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = lineColor.CGColor
        shapeLayer.lineWidth = 1.0
        
        view.layer.addSublayer(shapeLayer)
    }
    
    func fromPointToPoint(somepoint: CGPoint) -> (start: CGPoint, end: CGPoint) {
        let x = somepoint.x + 50
        let y = somepoint.y + 50
        let start = CGPoint(x: x,y: y)
        let end = CGPoint(x: somepoint.x + 60, y: somepoint.y + 80)
        
        return (start, end)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Constants.height = CGFloat(100)
        Constants.width = CGFloat(100)
        Constants.XCoor = 20
        Constants.YCoor = 20
        
        let subView = UIView(frame: CGRectMake(0, 0, Constants.width, Constants.height))
        Constants.height = view.frame.size.height
        Constants.width = view.frame.size.width
        
        for _ in 0...10 {
            let x = createButton()

            x.frame = CGRectMake(CGFloat(Constants.XCoor), CGFloat(Constants.YCoor), 100, 50)
            x.setTitle("Some Group", forState: UIControlState.Normal)
            x.addTarget(self, action: #selector(buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
            
            x.backgroundColor = UIColor.redColor()
            x.layer.cornerRadius = 5
            x.layer.borderWidth = 1
            x.layer.borderColor = UIColor.blackColor().CGColor
            
            subView.addSubview(x)
            
            let (start, end) = fromPointToPoint(CGPoint(x: Constants.XCoor, y: Constants.YCoor))
            
            Constants.XCoor += 10
            Constants.YCoor += 80
            
            Constants.height += 80
            Constants.width += 10
            
            drawLineFromPoint(start, toPoint: end, ofColor: UIColor.whiteColor(), inView: subView)
        }
        
        subView.frame.size.height = Constants.height
        subView.frame.size.width = Constants.width
        
        subView.backgroundColor=UIColor.blueColor()
        subView.layer.cornerRadius=25
        subView.layer.borderWidth=2
        self.view.addSubview(subView)
        
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.blackColor()
        scrollView.contentSize = subView.bounds.size
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        scrollView.addSubview(subView)
        view.addSubview(scrollView)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
