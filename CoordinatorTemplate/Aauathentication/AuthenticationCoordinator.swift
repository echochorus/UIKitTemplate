//
//  AuthenticationCoordinator.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-24.
//

import UIKit

class AuthenticationCoordinator: Coordinator {
    weak var appCoordinator: AppCoordinator?
    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = AuthenticationViewController()
        vc.tabBarItem = UITabBarItem(title: "Auth", image: UIImage(systemName: "lock"), tag: 1)
        vc.navigationItem.title = "Authentication"
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    /*
     func didFinishAuthentication() {
         parentCoordinator?.childDidFinish(self)
     }
     */
}
