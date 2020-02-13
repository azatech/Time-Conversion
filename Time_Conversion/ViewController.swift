//
//  ViewController.swift
//  Time_Conversion
//
//  Created by Azat Chorekliev on 1/28/20.
//  Copyright © 2020 Azat Chorekliev. All rights reserved.
//

import UIKit

class ConversionViewController: UITableViewController, UITextFieldDelegate {



    @IBOutlet weak var convertFromSegmentedControl: UISegmentedControl!
    @IBOutlet weak var timeTextField: UITextField!
    {
        didSet {
            timeTextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.doneBtnPressed)), onCancel: (target: self, action: #selector(self.cancelButtonDidTap)))
        }
    }
    @IBOutlet weak var convertFromLabel: UILabel!
    @IBOutlet weak var convertToSegmentedControl: UISegmentedControl!
    @IBOutlet weak var convertToLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!



    var selectedItemLbl: String = "You have selected "

    var segmentIndexTo = 0
    var segmentIndexFrom = 0

    @objc func doneBtnPressed() {

        timeTextField.resignFirstResponder()
        calculateValue()
        print("Done")



        // convert BTN

    }



    @objc func cancelButtonDidTap() {

        timeTextField.resignFirstResponder()
        timeTextField.text = ""
        print("Cancel")



    }
    override func viewDidLoad() {
        super.viewDidLoad()

        convertToLabel.text = selectedItemLbl + "Seconds"
        convertFromLabel.text = selectedItemLbl + "Seconds"

        timeTextField.delegate = self

//        let tap = UIGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
//
//        tap.cancelsTouchesInView = false
//        view.addGestureRecognizer(tap)

        
        convertToSegmentedControl.addTarget(self, action: #selector(valueSegment1DidChange), for: .valueChanged)
        convertFromSegmentedControl.addTarget(self, action: #selector(valueSegment2DidChange), for: .valueChanged)

        // delegate Text Field
//        timeTextField.delegate = self
        timeTextField.text = "0"
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("true editing")
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {

        becomeFirstResponder()

        textField.keyboardType = .numberPad

        print("editing")
    }

    // MARK: Main thing
    func calculateValue() {

        // Watch what in textField
        guard let textInput = timeTextField.text else { return }

        // Convert From


//        SECONDS
        if segmentIndexFrom == 0 && segmentIndexTo == 0  {
            print("SECONDE TO SECONDE")

            resultLabel.text = " Your result is: \(textInput)"
        } else if segmentIndexFrom == 0 && segmentIndexTo == 1  {
            print("SECONDE TO Minutes")
            let newValue = ((Double(textInput) ?? 0) / 60)
            resultLabel.text = " Your result is: \(String(newValue))"

        } else if segmentIndexFrom == 0 && segmentIndexTo == 2  {
            print("SECONDE TO HOurs")
            let newValue = ((Double(textInput) ?? 0) / 3600)
            resultLabel.text = " Your result is: \(String(newValue))"
        } else if segmentIndexFrom == 0 && segmentIndexTo == 3  {
            print("SECONDE TO Days")
            let newValue = ((Double(textInput) ?? 0) / 86400)
            resultLabel.text = " Your result is: \(String(newValue))"
        }


            // MINUTES

        else if segmentIndexFrom == 1 && segmentIndexTo == 0  {
            print("Minutes to Seconds")
            let newValue = ((Double(textInput) ?? 0) * 60)
            resultLabel.text = " Your result is: \(String(newValue))"
        } else if segmentIndexFrom == 1 && segmentIndexTo == 1  {
            print("Minutes to Minutes")
            resultLabel.text = " Your result is: \(textInput)"

        } else if segmentIndexFrom == 1 && segmentIndexTo == 2  {

            let newValue = ((Double(textInput) ?? 0) / 60)
            resultLabel.text = " Your result is: \(String(newValue))"
            print("Minutes to Hours")
        } else if segmentIndexFrom == 1 && segmentIndexTo == 3  {

            print("Minutes to Days")

            let newValue = ((Double(textInput) ?? 0) / 1440)
            resultLabel.text = " Your result is: \(String(newValue))"
        }

// HOURS
        else if segmentIndexFrom == 2 && segmentIndexTo == 0  {
            print("Hours to Seconds")

            let newValue = ((Double(textInput) ?? 0) * 3600)
            resultLabel.text = " Your result is: \(String(newValue))"
        }    else if segmentIndexFrom == 2 && segmentIndexTo == 1  {
            print("Hours to minutes")

            let newValue = ((Double(textInput) ?? 0) * 60)
            resultLabel.text = " Your result is: \(String(newValue))"
        }   else if segmentIndexFrom == 2 && segmentIndexTo == 2  {
            print("Hours to Hours")
            resultLabel.text = " Your result is: \(textInput)"

        }else if segmentIndexFrom == 2 && segmentIndexTo == 3  {
            print("HOURS to days ")

            let newValue = ((Double(textInput) ?? 0) / 24)
            resultLabel.text = " Your result is: \(String(newValue))"
        }



            // DAYS
        else if segmentIndexFrom == 3 && segmentIndexTo == 0  {
            print("Days to Seconds")

            let newValue = ((Double(textInput) ?? 0) * 86400)
            resultLabel.text = " Your result is: \(String(newValue))"

        }    else if segmentIndexFrom == 3 && segmentIndexTo == 1  {
            print("Days to Minutes")

            let newValue = ((Double(textInput) ?? 0) * 1440)
            resultLabel.text = " Your result is: \(String(newValue))"

        }   else if segmentIndexFrom == 3 && segmentIndexTo == 2  {
            print("Days to Hours")

            let newValue = ((Double(textInput) ?? 0) * 24)
            resultLabel.text = " Your result is: \(String(newValue))"

        }   else if segmentIndexFrom == 3 && segmentIndexTo == 3  {
            print("Days to days ")
            resultLabel.text = " Your result is: \(textInput)"

        }


        // Convert To

        // Еще что-то


    }

    @objc func valueSegment1DidChange(_ segment: UISegmentedControl){

        segmentIndexTo = segment.selectedSegmentIndex


        if segmentIndexTo == 0 {
            print("1")
            convertToLabel.text = selectedItemLbl + "Seconds"
            calculateValue()
        } else if segmentIndexTo == 1 {
            print("2")
            calculateValue()

            convertToLabel.text =  selectedItemLbl + "Minutes"
        } else if segmentIndexTo == 2 {
            print("3")
            calculateValue()

            convertToLabel.text =  selectedItemLbl + "Hours"
        } else if segmentIndexTo == 3 {
            print("4")
            calculateValue()

            convertToLabel.text =  selectedItemLbl + "Days"
        }

    }


    @objc func valueSegment2DidChange(_ segment: UISegmentedControl) {


        segmentIndexFrom = segment.selectedSegmentIndex

               if segmentIndexFrom == 0 {
                   print("1")
                convertFromLabel.text = selectedItemLbl + "Seconds"
                calculateValue()

               } else if  segmentIndexFrom == 1 {
                   print("2")

                   convertFromLabel.text = selectedItemLbl + "Minutes"
                calculateValue()

               } else if segmentIndexFrom == 2 {
                   print("3")
                   convertFromLabel.text = selectedItemLbl + "Hours"
                calculateValue()

               } else if segmentIndexFrom == 3 {
                   print("4")
                   convertFromLabel.text = selectedItemLbl + "Days"
                calculateValue()

               }
    }


//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//
//
//        print("begin")
//        return true
//    }
//        (_ textField: UITextField) {
//        becomeFirstResponder()
//
//        textField.keyboardType = .numberPad
//
//        print("begin editing")
//    }


    // UI Preparation
    private func prepareUI() {
        title = "Time Conversion"
        navigationController?.navigationBar.prefersLargeTitles = true

    }
}



extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))

        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()

        self.inputAccessoryView = toolbar
    }

    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}

