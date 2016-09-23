//
//  MainViewController.swift
//  SolidDemo
//
//  Created by Igor Matyushkin on 09.11.15.
//  Copyright © 2015 Igor Matyushkin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: Class variables & properties
    
    
    // MARK: Class methods
    
    
    // MARK: Initializers
    
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    
    // MARK: Outlets
    
    @IBOutlet fileprivate weak var textView: UITextView!
    
    
    // MARK: Variables & properties
    
    
    // MARK: Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Start selection
        
        let sourceArray = [1, 5, 10, 128, 256, 1024, 2048, 4096, 8000, 8390]
        
        let query = (sourceArray as NSArray)
            .beginQuery()
            .skip(count: 2)
            .take(count: 4)
            .filter(predicate: { (element) -> Bool in
                (element as! Int) > 200
            })
            .obtain { (element) -> AnyObject in
                let elementValue = element as! Int
                return (elementValue + 200) as AnyObject
            }
        
        var logText = ""
        
        for item in query.queryChain() {
            let descriptionForCurrentItem = item.queryDescription()
            logText += descriptionForCurrentItem + "\n\n"
        }
        
        let result = query.endQuery()
        
        logText += String(format: "Result of selection: %@", arguments: [result])
        
        textView.text = logText
        textView.font = UIFont.systemFont(ofSize: 20.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Private methods
    
    
    // MARK: Actions
    
    
    // MARK: Protocol methods
    
}
