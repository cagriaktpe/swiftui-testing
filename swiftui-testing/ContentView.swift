//
//  ContentView.swift
//  swiftui-testing
//
//  Created by Samet Çağrı Aktepe on 25.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    var body: some View {
        TabView {
            Text("🏠 Home Screen")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("🔖 Bookmark Screen")
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Bookmark")
                }
            Text("⚙️ Settings Screen")
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
        .fullScreenCover(isPresented: .constant(!hasSeenOnboarding)) {
            let plistManager = PlistManagerImpl()
            let onboardingContentManager = OnboardingContentManagerImpl(manager: plistManager)
            
            OnboardingScreenView(manager: onboardingContentManager) {
                hasSeenOnboarding = true
            }
        }
    }
}

#Preview {
    ContentView()
}
