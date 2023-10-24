//
//  InformationCoordinator.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-24.
//

import UIKit

final class InformationCoordinator: Coordinator {
    weak var appCoordinator: AppCoordinator?
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) { 
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = InformationViewController()
        vc.tabBarItem = UITabBarItem(title: "Information", image: UIImage(systemName: "info"), tag: 2)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
