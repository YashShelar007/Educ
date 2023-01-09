//
//  ViewController.swift
//  educ
//
//  Created by Ayham Dewan on 11/30/22.
//

import UIKit
import FirebaseDatabase
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logo.image = UIImage(named: "EDUClogo")
    }
    
    var check:Bool = false;
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var accountErrorLabel: UILabel!
    
    private let database = Database.database().reference()


    @IBAction func submitClicked(_ sender: Any) {
        if (emailField.text == "" || passwordField.text == "")
        {
            errorLabel.text = "* Please fill out all fields."
        }
        else
        {
           verify()
        }

    }
    
    
    func verify() {
       
        if (emailField.text == "" || passwordField.text == "")
        {
            errorLabel.text = "* Please fill out all fields."
        }
        else
        {
            Auth.auth().signIn(withEmail: self.emailField.text!, password: self.passwordField.text!) { (res,err) in
                
                if err != nil
                {
                    self.errorLabel.text = err?.localizedDescription
                }
                else
                {
                    self.performSegue(withIdentifier: "toHome", sender: self)
                }
            }
        }
     
    }
}

