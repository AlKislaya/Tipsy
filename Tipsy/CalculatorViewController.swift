//
//  ViewController.swift
//  Tipsy
//
//  Created by Alexandra on 15.10.25.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPrcButton: UIButton!
    @IBOutlet weak var tenPrcButton: UIButton!
    @IBOutlet weak var twentyPrcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectTip(target: tenPrcButton)
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        selectTip(target: sender)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "goToResults"{
            return
        }
        
        let tipAmount = getSelectedTipValue()
        let billAmount = Float(billTextField.text ?? "0") ?? 0
        let totalAmount = billAmount + (billAmount * tipAmount / 100)
        let totalPersons = Float(splitNumberLabel.text ?? "0") ?? 0
        
        let totalAmountPerPerson = totalAmount / totalPersons
        
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.totalPersons = Int(totalPersons)
        destinationVC.tipAmount = tipAmount
        destinationVC.totalAmountPerPerson = totalAmountPerPerson
    }
    
    func selectTip(target: UIButton) {
        zeroPrcButton.isSelected = zeroPrcButton == target
        tenPrcButton.isSelected = tenPrcButton == target
        twentyPrcButton.isSelected = twentyPrcButton == target
    }
    
    func getSelectedTipValue() -> Float {
        if tenPrcButton.isSelected {
            return 10
        }
        if twentyPrcButton.isSelected {
            return 20
        }
        return 0
    }
}

