//
//  ContentView.swift
//  CopilotIOSApp
//
//  Created with GitHub Copilot Pro
//

import SwiftUI

struct ContentView: View {
    @State private var message = "Hello, Copilot Pro!"
    @State private var counter = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "sparkles")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .font(.system(size: 60))
                
                Text(message)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Tap count: \(counter)")
                    .font(.headline)
                
                Button(action: {
                    counter += 1
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Increment")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                NavigationLink(destination: AIFeaturesView()) {
                    HStack {
                        Image(systemName: "cpu")
                        Text("AI Features")
                    }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                NavigationLink(destination: TaskListView()) {
                    HStack {
                        Image(systemName: "checklist")
                        Text("Task Manager")
                    }
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .navigationTitle("Copilot iOS App")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
