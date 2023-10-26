//
//  AuthenticationViewController.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-24.
//

import UIKit

class AuthenticationViewController: UIViewController {

    weak var coordinator: AuthenticationCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

    /*
     // NOTE: - Fore use only when a single ViewController in necessary:
     
     override func viewDidDisappear(_ animated: Bool) {
         super.viewDidDisappear(animated)
         coordinator?.didFinishAuthentication()
     }
     */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
