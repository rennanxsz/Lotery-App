//
//  ViewController.swift
//  Lotery-App
//
//  Created by Rennan Bruno on 07/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    
    @IBOutlet var balls: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func generateGame() {
    }
    
}

