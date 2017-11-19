import UIKit

class LogonViewController: UIViewController {
    let logonButton: UIButton!

    init() {
        logonButton = UIButton(type: .system)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
