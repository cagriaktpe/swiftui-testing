//
//  PlistManager.swift
//  onboarding-swiftui
//
//  Created by Samet Çağrı Aktepe on 24.11.2023.
//

import Foundation

protocol PlistManager {
    func convert(plist filename: String) -> [OnboardingItem]
}

struct PlistManagerImpl: PlistManager {
    func convert(plist filename: String) -> [OnboardingItem] {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let items = try? PropertyListDecoder().decode([OnboardingItem].self, from: data) else {
            return []
        }
        return items
    }
}
