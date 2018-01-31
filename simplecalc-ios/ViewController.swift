//
//  ViewController.swift
//  simplecalc-ios
//
//  Created by Ben Nogawa on 1/31/18.
//  Copyright © 2018 Ben Nogawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var averageTotal:Double = 0
    var averageCount:Double = 1
    var performingMath = false
    var operation = 0;
    var count = 1;
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 18 && sender.tag != 19
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 11 //count
            {
                label.text = "count"
                count = count + 1
            }
            if sender.tag == 12  //avg
            {
                label.text = "avg"
                averageTotal = averageTotal + previousNumber
                averageCount = averageCount + 1
            }
            if sender.tag == 13 //fact
            {
                label.text = "fact"
            }
            if sender.tag == 14 //divide
            {
                label.text = "/"
            }
            if sender.tag == 15 //multiply
            {
                label.text = "*"
            }
            if sender.tag == 16 // subtract
            {
                label.text = "-"
            }
            if sender.tag == 17 //add
            {
                label.text = "+"
            }
            
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 19
        {
            if operation == 14 //divide
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 15 //multiply
            {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 16 //subtract
            {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 17 //add
            {
                label.text = String(previousNumber + numberOnScreen)
            }
            else if operation == 11 //count
            {
                label.text = String(count)
            }
            else if operation == 12
            {
                averageTotal = averageTotal + numberOnScreen
                label.text = String(averageTotal / averageCount)
            }
            else if operation == 13
            {
                var total:Double = previousNumber
                var number:Double = previousNumber - 1
                total = total * number
                number = number - 1
                while number > 0
                {
                    total = total * number
                    number = number - 1
                }
                label.text = String(total)
            }
        }
        else if sender.tag == 18
        {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            count = 1
            averageTotal = 0
            averageCount = 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

