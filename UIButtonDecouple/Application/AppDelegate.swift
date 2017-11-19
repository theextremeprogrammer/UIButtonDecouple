import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        let viewController = LogonViewController()
        viewController.view.backgroundColor = .white

        window = UIWindow()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()

        return true
    }
}
