//
//  AddPersonViewController.swift
//  CareMapping
//
//  Created by Connor Fitzpatrick on 5/21/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBAction func done(sender: UIBarButtonItem) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func firstName(sender: UITextField) {
    }
    
    @IBAction func lastName(sender: UITextField) {
    }
    
    @IBAction func position(sender: UITextField) {
    }
    
    @IBAction func email(sender: UITextField) {
    }
    
    @IBAction func phoneNumber(sender: UITextField) {
    }
    @IBAction func website(sender: UITextField) {
    }
    
    @IBOutlet weak var notes: UITextView!
    
    @IBOutlet weak var image: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
