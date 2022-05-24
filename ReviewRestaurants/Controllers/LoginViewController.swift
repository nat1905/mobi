//
//  LoginViewController.swift
//  ReviewRestaurants
//
//  Created by admin on 5/23/22.
//

import UIKit
import PhoneNumberKit

class LoginViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var proceedButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: Actions
    
    @IBAction func login(_ sender: Any) {
//        let restsArray: [Restaurant] = [Restaurant(name: "MyRest"), Restaurant(name: "MyRest)]
//
//        DatabaseManager.shared.insertRestaurants(restsArray)
        
        let rests = DatabaseManager.shared.restaurantsFromDb()
        
        return
        
        
//        for user in users {
//            if emailTextField.text == user.email && passwordTextField.text == user.password {
//                self.performSegue(withIdentifier: kGoToSecondScreenSegue, sender: self)
//                return
//            }
//        }
    }
    
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? DashboardViewController {
            
            controller.mainLabelText = "Welcome to out app"
        }
        else if let controller = segue.destination as? CreateAccountViewController {
            controller.registrationDelegate = self
        }
    }
    
    // MARK: Constants
    
    let kGoToSecondScreenSegue: String = "goToSecondController"
    
    
    // MARK: Variables
    
    var users: [User] = []
    
    
    // MARK: Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.placeholder = NSLocalizedString("EMAIL", comment: "") 
        
        proceedButton.setTitle("PRESS", for: .normal)
        // Do any additional setup after loading the view.
        
    }
}

extension LoginViewController: DashboardViewControllerDelegate {
    
    func returnString(_ string: String) {
        self.emailTextField.text = string
    }
}

extension LoginViewController: RegistrationDelegate {
    func didSaveNewUser(_ user: User) {
        users.append(user)
    }
}
