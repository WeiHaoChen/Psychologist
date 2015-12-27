//
//  ViewController.swift
//  Psychologist
//
//  Created by 陈伟浩 on 15/12/24.
//  Copyright © 2015年 陈伟浩. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController
{
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController
        {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? DiagnosedHappinessViewController
        {
            if let identifier = segue.identifier
            {
                switch identifier
                {
                    case "sad": hvc.happiness = 0
                    case "happy": hvc.happiness = 100
                    case "nothing": hvc.happiness = 25
                    default: hvc.happiness = 50
                }
            }
        }
    }
}

