//
//  AuthenticationCoordinator.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-24.
//

import UIKit

class AuthenticationCoordinator: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(childCoordinators: [Coordinator] = [Coordinator](), navigationController: UINavigationController) {
        self.childCoordinators = childCoordinators
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AuthenticationViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    /*
     func didFinishAuthentication() {
         parentCoordinator?.childDidFinish(self)
     }
     */
}
