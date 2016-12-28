//
//  MakeAQuizView.swift
//  Quizzles
//
//  Created by dipt on 2016-12-09.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit

class MakeAQuizView: UIViewController {
    
    @IBOutlet weak var QuizeTypeTextBox: UITextField!
    
    @IBOutlet weak var QuizTypePicker: UIPickerView!
    
    var list = ["Study","Exam"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(QuizTypePicker: UIPickerView) -> Int
    {
        return 1
    }
    
    func QuizTypePicker(QuizTypePicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
         return list.count
    
    }
    
    
    func QuizTypePicker(QuizTypePicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    
        self.view.endEditing(true)
        return list[row]
    
    }
    
    func QuizTypePicker(QuizTypePicker: UIPickerView, didSelectRow row: Int, forComponent component: Int) {
        
        self.QuizeTypeTextBox.text = self.list[row]
        self.QuizTypePicker.isHidden = true
    
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
     
        if textField == self.QuizeTypeTextBox  {
            self.QuizTypePicker.isHidden = false
            
            textField.endEditing(true)
        }
    
    }
    
    
}

class MakeAQuizView2: UIViewController, UIPickerViewDelegate,  UIPickerViewDataSource {
    
    @IBOutlet weak var subjectButton: UIButton!
    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        self.picker.dataSource = self
        self.picker.delegate = self
        self.picker.isHidden = true

        pickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
        
    }
    
    @IBAction func subjectClicked(_ sender: Any) {
        self.subjectButton.isHidden = true
        self.picker.isHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
}

class MakeAQuizView3: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
