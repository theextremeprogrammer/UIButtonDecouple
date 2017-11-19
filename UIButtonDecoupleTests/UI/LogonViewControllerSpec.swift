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
            it("displays a logon button") {
                let logonVC = LogonViewController()


                expect(logonVC.logonButton.titleLabel?.text).to(equal("Logon"))
            }

            it("invokes the authentication service when tapping the button") {
                let authenticatorSpy = AuthenticatorSpy()
                let logonVC = LogonViewController(
                    authenticator: authenticatorSpy
                )


                logonVC.logonButton.tap()


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
