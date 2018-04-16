//
//  LoginViewController.swift
//  parsetagram
//
//  Created by kimeric on 2/20/18.
//  Copyright © 2018 EricKim. All rights reserved.
//

import UIKit
import Parse
//import MBProgressHUD


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user, error) in
            if user != nil {
                print("You are logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else{
                self.createAlert(alertTitle: "Log In Failed", alertMessage: (error?.localizedDescription)!, actionTitle: "OK", segue: false)
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success, error) in
            if success {
                print("Yay, created a user!")
//                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                self.createAlert(alertTitle: "Account created!", alertMessage: "You have successfully created a new account", actionTitle: "OK", segue: true)
            }
            else{
                print(error?.localizedDescription as Any)
                self.createAlert(alertTitle: "Sign Up Failed", alertMessage: (error?.localizedDescription)!, actionTitle: "OK", segue: false)
            }
        }
    }
    
    
    func createAlert(alertTitle: String, alertMessage: String, actionTitle: String, segue: Bool){
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        var action: UIAlertAction!
        if(segue == true){
            action = UIAlertAction(title: actionTitle, style: .default) { (action) -> Void in
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
        else{
            action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
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
