//
//  LoginViewController.swift
//  parse_chat
//
//  Created by Cameryn Boyd on 6/26/17.
//  Copyright © 2017 Cameryn Boyd. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUpButton(_ sender: Any) {
        let newUser = PFUser()
        
        //set user properties
        newUser.username = usernameTextField.text
        newUser.password = passwordTextField.text
        
        //call sign up function
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            
            } else {
                print("User successfully registered!")
            }
            
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
        
        let alertController = UIAlertController(title: "Password and Username Required", message: "Please fill in both fields.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Okay", style: .cancel) { (UIAlertAction) in
        }
        alertController.addAction(cancelAction)
        
        if ((usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!) {
            present(alertController, animated: true)
        }
        
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User login failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully!")
            }
        }
        
        let alertController = UIAlertController(title: "Password and Username Required", message: "Please fill in both fields.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Okay", style: .cancel) { (UIAlertAction) in
        }
        alertController.addAction(cancelAction)
        
        if ((usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!) {
            present(alertController, animated: true)
        }

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
