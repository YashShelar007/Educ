//
//  SignUpPage.swift
//  educ
//
//  Created by Ayham Dewan on 11/30/22.
//

import UIKit
import FirebaseDatabase
import Firebase


class SignUpPage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    private let database = Database.database().reference()
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        if (emailField.text == "" || passwordField.text == "")
        {
            errorLabel.text = "* Please fill out all fields."
        }
        else
        {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!){ (res,err) in
                
                if err != nil
                {
                    self.errorLabel.text = err?.localizedDescription
                }
                else
                {
                    self.performSegue(withIdentifier: "toHomeFromSign", sender: self)
                }
            }
        }
        
    }
}
