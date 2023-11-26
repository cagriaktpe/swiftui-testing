//
//  OnboardingContentMockImp.swift
//  swiftui-testingTests
//
//  Created by Samet Çağrı Aktepe on 25.11.2023.
//

import Foundation
@testable import swiftui_testing

final class OnboardingContentMockImpl: OnboardingContentManager {
    
    var limit: Int {
        return items.count - 1
    }
    
    var items: [OnboardingItem]
    
    required init(manager: PlistManager) {
        self.items = manager.convert(plist: "FruitLoops")
    }
}
