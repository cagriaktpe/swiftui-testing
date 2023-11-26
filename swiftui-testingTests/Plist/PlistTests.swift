//
//  PlistTests.swift
//  swiftui-testingTests
//
//  Created by Samet Çağrı Aktepe on 25.11.2023.
//

import XCTest
@testable import swiftui_testing

final class PlistTests: XCTestCase {
    
    private var manager: PlistManagerImpl!
    
    override func setUpWithError() throws {
        manager = PlistManagerImpl()
    }
    
    override func tearDownWithError() throws {
        manager = nil
    }
    
    func test_successfull_decoding_onboard_plist() throws {
        XCTAssertEqual(manager.convert(plist: "OnboardingContent").count, 3)
    }
    
    func test_unsuccessfull_decoding_onboard_plist() throws {
        XCTAssertEqual(manager.convert(plist: "Dummy").count, 0)
    }
}
