//
//  AboutYourself.swift
//  educ
//
//  Created by NewUser on 12/1/22.
//

import UIKit

class AboutYourself: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func storeInfo(_ sender: Any) {
        if(name.text == nil && city.text == nil)
        {
            errorMessage.text = "* Please fill out all fields."
        }
        else
        {
            self.performSegue(withIdentifier: "toGame", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "toGame"){
            if let viewController: HomePage = segue.destination as? HomePage {
                viewController.userCity = city.text;
                viewController.userName = name.text;
            }
        }
    }

}
