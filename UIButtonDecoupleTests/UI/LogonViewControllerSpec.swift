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
                logonVC.tapButton(withText: "Logon")


                expect(authenticatorSpy.logon_wasCalled).to(beTrue())
            }
        }
    }
}

extension UIViewController {
    func tapButton(withText searchText: String) {
        view
            .findButton(withText: searchText)?
            .tap()
    }
}

extension UIView {
    func findButton(withText searchText: String) -> UIButton? {
        return subviews
            .flatMap { subview -> UIButton? in
                return subview as? UIButton ?? subview.findButton(withText: searchText)
            }
            .filter { button -> Bool in
                return button.titleLabel?.text == searchText
            }
            .first
    }
}

extension UIButton {
    func tap() {
        sendActions(for: .touchUpInside)
    }
}
