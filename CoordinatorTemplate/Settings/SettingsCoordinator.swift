//
//  SettingsCoordinator.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-24.
//

import UIKit

final class SettingsCoordinator: Coordinator {
    weak var appCoordinator: AppCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = SettingsViewController()
        vc.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 3)
        vc.navigationItem.title = "Settings"
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
