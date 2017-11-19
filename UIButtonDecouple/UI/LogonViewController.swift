import UIKit

protocol Authenticator {
    func logon()
}

class LogonViewController: UIViewController {
    let authenticator: Authenticator?

    private let logonButton: UIButton!

    // MARK: - Initialization
    init(authenticator: Authenticator? = nil) {
        self.authenticator = authenticator

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
        view.addSubview(logonButton)

        logonButton.setTitle("Logon", for: .normal)
        logonButton.addTarget(
            self,
            action: #selector(didTapLogonButton(sender:)),
            for: .touchUpInside
        )
    }
}

// MARK: - Actions
extension LogonViewController {
    @objc func didTapLogonButton(sender: UIButton) {
        authenticator?.logon()
    }
}
