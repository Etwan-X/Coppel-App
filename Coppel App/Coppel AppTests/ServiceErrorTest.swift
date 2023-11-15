//
//  ServiceErrorTest.swift
//  Coppel AppTests
//
//  Created by Etwan on 15/11/23.
//

import XCTest
@testable import Coppel_App

final class ServiceErrorTest: XCTestCase {

    var sut: AuthViewController!
    var correo = "etwan.x@me.com"
    var contrasenia = "0Sevi11@a"
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = AuthViewController()
        sut.loadViewIfNeeded()
        
        sut.emailTextField.text = correo
        sut.passwordTextField.text = contrasenia
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let email = AuthController().checkEmail(view: sut).text
        let password = AuthController().checkPassword(view: sut).text
        XCTAssertEqual(email, correo)
        XCTAssertEqual(password, contrasenia)
        
        
    }
}
