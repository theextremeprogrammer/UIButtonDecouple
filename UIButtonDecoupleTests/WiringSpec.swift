import Quick
import Nimble
@testable import UIButtonDecouple

class WiringSpec: QuickSpec {
    override func spec() {
        describe("wiring") {
            it("can run tests") {
                let i = 12
                expect(i).to(equal(12))
            }
        }
    }
}
