//
//  ViewController.swift
//  ConvertToDecimal
//
//  Created by Sarawanak on 2/27/18.
//  Copyright © 2018 Sarawanak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var romanTextField: UITextField!
    @IBOutlet weak var decimalTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertTapped(_ sender: Any) {
        guard let rStr = romanTextField.text,
            let number = Number(for: rStr)?.value else {
                errorLabel.isHidden = false
                decimalTextField.text = ""
                return
        }

        decimalTextField.text = "\(number)"
    }
}

