//
//  OnboardingContentTests.swift
//  swiftui-testingTests
//
//  Created by Samet Çağrı Aktepe on 25.11.2023.
//

import XCTest
@testable import swiftui_testing

final class OnboardingContentTests: XCTestCase {
    
    private var manager: PlistManagerImpl!
    
    override func setUpWithError() throws {
        manager = PlistManagerImpl()
    }
    
    override func tearDownWithError() throws {
        manager = nil
    }
    
    func test_successfull_onboarding_decoding() throws {
        let contentManager = OnboardingContentManagerImpl(manager: manager)
        XCTAssertEqual(contentManager.items.count, 3)
    }
    
    func test_unsuccessfull_onboarding_decoding() throws {
        let mock = OnboardingContentMockImpl(manager: manager)
        XCTAssertEqual(mock.items.count, 0)
    }
    
    func test_successfull_onboarding_limit() throws {
        let contentManager = OnboardingContentManagerImpl(manager: manager)
        XCTAssertEqual(contentManager.limit, 2)
    }
    
    func test_unsuccessfull_onboarding_limit() throws {
        let mock = OnboardingContentMockImpl(manager: manager)
        XCTAssertLessThan(mock.limit, 0)
    }
}
