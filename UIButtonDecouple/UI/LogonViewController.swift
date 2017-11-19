import UIKit
import PureLayout

protocol Authenticator {
    func logon()
}

protocol LogonViewDelegate {
    func tryLogon()
}

class LogonView: UIView {
    var delegate: LogonViewDelegate?

    private let logonButton: UIButton!

    override init(frame: CGRect) {
        logonButton = UIButton(type: .system)

        super.init(frame: frame)

        configureViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Setup
fileprivate extension LogonView {
    func configureViews() {
        addSubview(logonButton)

        logonButton.setTitle("Logon", for: .normal)
        logonButton.addTarget(
            self,
            action: #selector(didTapLogonButton(sender:)),
            for: .touchUpInside
        )
        logonButton.autoCenterInSuperview()
    }
}

// MARK: - Actions
extension LogonView {
    @objc func didTapLogonButton(sender: UIButton) {
        delegate?.tryLogon()
    }
}

class LogonViewController: UIViewController {
    let authenticator: Authenticator?

    let logonView: LogonView!

    // MARK: - Initialization
    init(authenticator: Authenticator? = nil) {
        self.authenticator = authenticator

        logonView = LogonView.newAutoLayout()

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
        view.addSubview(logonView)

        logonView.delegate = self

        logonView.autoPinEdgesToSuperviewEdges()
    }
}

// MARK: - LogonViewDelegate
extension LogonViewController: LogonViewDelegate {
    func tryLogon() {
        authenticator?.logon()
    }
}
