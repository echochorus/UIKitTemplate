//
//  AppTabBarController.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-24.
//

import UIKit

class AppTabBarController: UITabBarController {

    let app = AppCoordinator(navigationController: UINavigationController())
    let authenticate  = AuthenticationCoordinator(navigationController: UINavigationController())
    let info = InformationCoordinator(navigationController: UINavigationController())
    let settings = SettingsCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()

        app.start()
        authenticate.start()
        info.start()
        settings.start()
        viewControllers = [app.navigationController, authenticate.navigationController, info.navigationController, settings.navigationController]
        tabBarController?.tabBar.barTintColor = .white
        tabBarController?.tabBar.backgroundColor = .white.withAlphaComponent(0.3)

        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .white
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
