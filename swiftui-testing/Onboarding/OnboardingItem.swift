//
//  OnboardingItem.swift
//  onboarding-swiftui
//
//  Created by Samet Çağrı Aktepe on 24.11.2023.
//

import Foundation

struct OnboardingItem: Identifiable, Codable {
    var id = UUID()
    var title: String?
    var content: String?
    var sfSymbol: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case content
        case sfSymbol
    }
    
    init(title: String? = nil, content: String? = nil, sfSymbol: String? = nil) {
        self.title = title
        self.content = content
        self.sfSymbol = sfSymbol
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.title = try container.decode(String?.self, forKey: .title)
            self.content = try container.decode(String?.self, forKey: .content)
            self.sfSymbol = try container.decode(String?.self, forKey: .sfSymbol)
        } catch {
            print("Error: \(error)")
        }
    }
}
