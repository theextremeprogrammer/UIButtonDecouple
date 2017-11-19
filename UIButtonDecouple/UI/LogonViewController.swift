import UIKit

class LogonViewController: UIViewController {
    let logonButton: UIButton!

    // MARK: - Initialization
    init() {
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
