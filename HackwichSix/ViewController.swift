//
//  ViewController.swift
//  HackwichSix
//
//  Created by CM Student on 3/5/18.
//  Copyright © 2018 Carlton Hui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var targetLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    //Create a variable that can hold the value of the slider
    var currentValue: Int = 0
    //Create a variable to hold the target value
    var targetValue: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Set currentValue to the initial value of the slider
        currentValue = lroundf(slider.value)
        //Set targetValue to a randomly generated number that in...the arc4random_uniform function.
        //targetValue = 1 + Int(arc4random_uniform(100))
        startNewRound()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
    }
    
    //Create a new function that displays the targetValue in the targetLabel
    func updateTargetLabel(){
        targetLabel.text = String(targetValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateTargetLabel()
    }

    @IBAction func sliderHasMoved(_ sender: Any) {
        print("The value of the slider is:\(slider.value)")
        currentValue = lroundf(slider.value)
    }
    @IBAction func myGuessButtonPressed(_ sender: Any) {
        
        let message = "The value is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title:"Hello World!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
}
