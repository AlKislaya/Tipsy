//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Alexandra on 15.10.25.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var totalAmountPerPerson:Float = 0
    var tipAmount:Float = 0
    var totalPersons:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.4f", totalAmountPerPerson)
        descriptionLabel.text = "Split between \(totalPersons) persons with \(Int(tipAmount))% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        dismiss(animated: true)
    }
}
