//
//  ContentView.swift
//  app1
//
//  Created by Patchen Long on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "lasso.badge.sparkles")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Testing!")
            Button("Button") {
                
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
