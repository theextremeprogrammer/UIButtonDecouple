import UIKit

protocol Authenticator {
    func logon()
}

class LogonViewController: UIViewController {
    let logonButton: UIButton!

    // MARK: - Initialization
    init(authenticator: Authenticator? = nil) {
        logonButton = UIButton(type: .system)

        super.init(nibName: nil, bundle: nil)

        configureViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Setup
fileprivate extension LogonViewController {
    func configureViews() {
        logonButton.setTitle("Logon", for: .normal)
    }
}
