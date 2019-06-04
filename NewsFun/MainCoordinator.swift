import UIKit

class MainCoordinator: Coordinator {
    var children = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showWebView(with article: Article) {
        let vc = WebViewController.instantiate()
        vc.coordinator = self
        vc.article = article
        navigationController.pushViewController(vc, animated: true)
    }
}
