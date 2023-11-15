//
//  AuthViewControllerTest.swift
//  Coppel AppTests
//
//  Created by Etwan on 15/11/23.
//

import XCTest
@testable import Coppel_App

final class AuthViewControllerTest: XCTestCase {

    var sut: AuthViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AuthViewController") as? AuthViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testLoadViewController() throws {
        _ = try XCTUnwrap(sut.view, "Se inicializó la vista")
    }

}
