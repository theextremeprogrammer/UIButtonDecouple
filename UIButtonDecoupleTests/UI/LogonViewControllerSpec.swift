import Quick
import Nimble
@testable import UIButtonDecouple

class AuthenticatorSpy: Authenticator {
    var logon_wasCalled = false
    func logon() {
        logon_wasCalled = true
    }
}

class LogonViewControllerSpec: QuickSpec {
    override func spec() {
        describe("the logon screen") {
            var authenticatorSpy: AuthenticatorSpy!
            var logonVC: LogonViewController!

            beforeEach {
                authenticatorSpy = AuthenticatorSpy()
                logonVC = LogonViewController(
                    authenticator: authenticatorSpy
                )
            }

            it("invokes the authentication service when tapping the button") {
                var logonButton: UIButton? = findButton(inView: logonVC.view, withText: "Logon")


                logonButton?.tap()


                expect(authenticatorSpy.logon_wasCalled).to(beTrue())
            }
        }

        func findButton(inView view: UIView, withText searchText: String) -> UIButton? {
            for subview in view.subviews {
                if let button = subview as? UIButton {
                    if button.titleLabel?.text == searchText {
                        return button
                    }
                }
            }

            return nil
        }
    }
}

extension UIButton {
    func tap() {
        sendActions(for: .touchUpInside)
    }
}
