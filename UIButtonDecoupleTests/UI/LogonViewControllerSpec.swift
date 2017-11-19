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
                var logonButton: UIButton? = nil

                for subview in logonVC.view.subviews {
                    if let button = subview as? UIButton {
                        if button.titleLabel?.text == "Logon" {
                            logonButton = button
                            break
                        }
                    }
                }


                logonButton?.tap()


                expect(authenticatorSpy.logon_wasCalled).to(beTrue())
            }
        }
    }
}

extension UIButton {
    func tap() {
        sendActions(for: .touchUpInside)
    }
}
