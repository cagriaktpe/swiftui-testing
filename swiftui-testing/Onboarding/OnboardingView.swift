//
//  OnboardingView.swift
//  onboarding-swiftui
//
//  Created by Samet Çağrı Aktepe on 24.11.2023.
//

import SwiftUI

typealias OnboardingGetStartedAction = () -> Void

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let item: OnboardingItem
    let handler: OnboardingGetStartedAction
    let limit: Int
    @Binding var index: Int
    
    init(item: OnboardingItem, limit: Int, index: Binding<Int>, handler: @escaping OnboardingGetStartedAction) {
        self.item = item
        self.limit = limit
        self._index = index
        self.handler = handler
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: item.sfSymbol ?? "")
                .padding(.bottom,50)
                .font(.system(size: 120, weight: .bold))
            
            Text(item.title ?? "")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.bottom, 2)
                .foregroundStyle(.black)
            
            Text(item.content ?? "")
                .font(.system(size: 12, weight: .regular))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .foregroundStyle(.gray)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                handler()
            }, label: {
                Text("Get started")
            })
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 25)
            .padding(.vertical, 10)
            .background(Color.blue)
            .clipShape(Capsule())
            .padding(.top, 50)
            .opacity(index == limit ? 1 : 0)
            .allowsHitTesting(index == limit)
            .animation(.easeInOut(duration: 0.25))
        }
        .padding(.bottom, 150)
    }
}

#Preview {
    OnboardingView(item: OnboardingItem(title: "Title", content: "Content", sfSymbol: "house"), limit: 0, index: .constant(0)) {
        
    }
}
