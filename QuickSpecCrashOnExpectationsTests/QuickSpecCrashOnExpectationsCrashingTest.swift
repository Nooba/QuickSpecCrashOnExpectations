//
//  QuickSpecCrashOnExpectationsCrashingTest.swift
//  QuickSpecCrashOnExpectationsTests
//
//  Created by Edouard Siegel on 10/03/2020.
//  Copyright © 2020 Edouard Siegel. All rights reserved.
//

import Quick
@testable import QuickSpecCrashOnExpectations

class QuickSpecCrashOnExpectationsCrashingTest: QuickSpec {

    override func spec() {
        it("Should timeout the test, yet it crashes") {
            let foo = "foo"
            self.expectation(forNotification: .NSManagedObjectContextDidSave, object: foo) { _ in
                return true
            }
            self.waitForExpectations(timeout: 3.0) { error in
                XCTAssertNil(error, "Save did not occur")
            }
        }
    }

}
