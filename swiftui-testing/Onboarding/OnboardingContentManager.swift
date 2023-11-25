//
//  OnboardingContentManager.swift
//  onboarding-swiftui
//
//  Created by Samet Çağrı Aktepe on 24.11.2023.
//

import Foundation

protocol OnboardingContentManager {
    var limit : Int { get }
    var items: [OnboardingItem] { get }
    init(manager: PlistManager)
}

final class OnboardingContentManagerImpl: OnboardingContentManager {
    
    var limit: Int {
        return items.count - 1
    }
    
    var items: [OnboardingItem]
    
    init(manager: PlistManager) {
        self.items = manager.convert(plist: "OnboardingContent")
    }
}
