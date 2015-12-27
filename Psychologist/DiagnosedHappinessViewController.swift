//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by 陈伟浩 on 15/12/26.
//  Copyright © 2015年 陈伟浩. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate
{
    override var happiness: Int {
        didSet {
            diagnoseticHistory += [happiness]
        }
    }
    
    var diagnoseticHistory: [Int] {
        get { return defaults.objectForKey(History.DefaultsKey) as?  [Int] ?? [] }
        set { defaults.setObject(newValue, forKey: History.DefaultsKey) }
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier: if let tvc = segue.destinationViewController as? TextViewController {
                
                if let ppc = tvc.popoverPresentationController {
                    ppc.delegate = self
                }
                
                  tvc.text = "\(diagnoseticHistory)"
                }
            default: break
             }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
}
