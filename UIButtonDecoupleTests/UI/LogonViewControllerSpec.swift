import Quick
import Nimble
@testable import UIButtonDecouple

class LogonViewControllerSpec: QuickSpec {
    override func spec() {
        describe("the logon screen") {
            it("displays a logon button") {
                let logonVC = LogonViewController()


                let logonButton = logonVC.logonButton


                expect(logonButton?.titleLabel?.text).to(equal("Logon"))
            }
        }
    }
}
