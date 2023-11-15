//
//  HomeViewTest.swift
//  Coppel AppUITests
//
//  Created by Etwan on 15/11/23.
//

import XCTest

final class HomeViewTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let email = app.textFields["emailTextField"]
        XCTAssertTrue(email.exists)
        
        email.tap()
        email.typeText("etwan.x@me.com")
        
        let password = app.secureTextFields["passwordTextField"]
        XCTAssertTrue(password.exists)
        
        password.tap()
        password.typeText("0Sevi11@")
        
        let loginButton = app.buttons["logInButton"]
        XCTAssertTrue(loginButton.exists)
        
        loginButton.tap()
        
        
        let categoriaComponent = app.collectionViews["categoriasCollection"]
        XCTAssertTrue(categoriaComponent.exists)
        let marcasComponent = app.collectionViews["marcasCollection"]
        XCTAssertTrue(marcasComponent.exists)
        let productosComponent = app.collectionViews["productosCollection"]
        XCTAssertTrue(productosComponent.exists)

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
