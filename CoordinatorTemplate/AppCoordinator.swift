//
//  AppCoordinator.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-24.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}

final class AppCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = ViewController.instantiate()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func authenticate() {
        let child = AuthenticationCoordinator(navigationController: navigationController)
        child.appCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func getInformation() {
        let child = InformationCoordinator(navigationController: navigationController)
        child.appCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func manageSettings() {
        let child = SettingsCoordinator(navigationController: navigationController)
        child.appCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}

extension AppCoordinator: UINavigationControllerDelegate {
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinaator) in childCoordinators.enumerated() {
            if coordinaator === child {
                childCoordinators.remove(at: index)
            }
        } 
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        if navigationController.viewControllers.contains(fromViewController) { return }
        if let authenticationViewController = fromViewController as? AuthenticationViewController {
            childDidFinish(authenticationViewController.coordinator)
        }
    }
}
