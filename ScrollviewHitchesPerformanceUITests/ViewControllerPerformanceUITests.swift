//
//  ViewControllerTestsUITests.swift
//  ScrollviewHitchesTestsUITests
//
//  Created by Yoshihisa Masaki on 2021/08/28.
//

import XCTest

class ViewControllerPerformanceUITests: XCTestCase {
    
    private let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCollectionViewScrollingPerformance() throws {
        let collectionView = app.collectionViews.firstMatch
        
        let measureOptions = XCTMeasureOptions()
        measureOptions.invocationOptions = [.manuallyStop]
        
        measure(metrics: [XCTOSSignpostMetric.scrollDecelerationMetric], options: measureOptions) {
            collectionView.swipeUp(velocity: .fast)
            stopMeasuring()
            collectionView.swipeDown(velocity: .fast)
        }
    }

}
