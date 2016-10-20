//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    //var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON

        // Connect data:
        self.fruitPicker.delegate = self
        self.fruitPicker.dataSource = self
        
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // The number of rows of data
    func pickerView(_ fruitPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ fruitPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        print("component: \(component) row: \(row) value \(fruitsArray[row])")
    }
    
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        
        self.fruitPicker.selectRow(randomSpin(), inComponent:0, animated:true)
        self.fruitPicker.selectRow(randomSpin(), inComponent:1, animated:true)
        self.fruitPicker.selectRow(randomSpin(), inComponent:2, animated:true)
        let result0 = fruitsArray[self.fruitPicker.selectedRow(inComponent: 0)]
        let result1 = fruitsArray[self.fruitPicker.selectedRow(inComponent: 1)]
        let result2 = fruitsArray[self.fruitPicker.selectedRow(inComponent: 2)]
        
        if result0 == result1 && result1 == result2 {
            resultLabel.text = "WINNER!"
        } else {
            resultLabel.text = "TRY AGAIN"
        }
        
    }
    
    func randomSpin() -> Int {
        return Int(arc4random_uniform(UInt32(self.fruitsArray.count)))
    }


}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



