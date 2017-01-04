//
//  SettingsView.swift
//  Quizzles
//
//  Created by dipt on 2016-12-13.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit

class TeachersSettingsView: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    var phoneNr="Phone Number: "
    var emailAdress="Email Adress: "
    var phone="0701234567"
    var email="teacher@mail.com"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        emailLabel.text=emailAdress + email
        phoneLabel.text=phoneNr + phone
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeText(_ sender: Any) {
        email=emailTextField.text!
        phone=phoneTextField.text!
        emailLabel.text=emailAdress + email
        phoneLabel.text=phoneNr + phone
    }
    
}

class StudentsSettingsView: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

class TeacherInfoView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


class StudentInfoView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
