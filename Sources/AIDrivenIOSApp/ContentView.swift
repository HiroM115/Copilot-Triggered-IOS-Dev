import SwiftUI

/// Main content view showcasing AI-driven development features
struct ContentView: View {
    @State private var userInput: String = ""
    @State private var aiResponse: String = ""
    @State private var isProcessing: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 8) {
                    Image(systemName: "brain.head.profile")
                        .font(.system(size: 60))
                        .foregroundStyle(.blue.gradient)
                    
                    Text("AI-Driven iOS Development")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Powered by GitHub Copilot Pro")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 40)
                
                Spacer()
                
                // Input Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Ask AI")
                        .font(.headline)
                    
                    TextField("Enter your question...", text: $userInput, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(3...6)
                    
                    Button(action: processInput) {
                        HStack {
                            if isProcessing {
                                ProgressView()
                                    .progressViewStyle(.circular)
                                    .tint(.white)
                            } else {
                                Image(systemName: "paperplane.fill")
                            }
                            Text(isProcessing ? "Processing..." : "Send")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(userInput.isEmpty ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .disabled(userInput.isEmpty || isProcessing)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                // Response Section
                if !aiResponse.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("AI Response")
                            .font(.headline)
                        
                        ScrollView {
                            Text(aiResponse)
                                .font(.body)
                                .padding()
                        }
                        .frame(maxHeight: 200)
                        .background(Color(.systemBackground))
                        .cornerRadius(10)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                
                Spacer()
                
                // Features List
                VStack(spacing: 16) {
                    NavigationLink(destination: AIAssistantView()) {
                        FeatureRow(icon: "message.fill", title: "AI Assistant Demo", description: "Interactive chat with AI")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    FeatureRow(icon: "sparkles", title: "AI Code Generation", description: "Generate Swift code with Copilot")
                    FeatureRow(icon: "wand.and.stars", title: "Smart Suggestions", description: "Intelligent code completions")
                    FeatureRow(icon: "lightbulb.fill", title: "Best Practices", description: "Follow iOS development patterns")
                }
                .padding(.bottom, 20)
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func processInput() {
        isProcessing = true
        aiResponse = ""
        
        // Simulate AI processing
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation {
                aiResponse = generateAIResponse(for: userInput)
                isProcessing = false
            }
        }
    }
    
    private func generateAIResponse(for input: String) -> String {
        // This is a placeholder for demonstration
        // In a real app, this would integrate with an AI service
        let responses = [
            "GitHub Copilot Pro can help you write SwiftUI code faster and more efficiently!",
            "AI-driven development enables rapid prototyping and reduces boilerplate code.",
            "With Copilot, you can focus on solving problems rather than syntax.",
            "Let AI assist you in writing tests, documentation, and implementing features.",
            "Copilot understands context and can suggest entire functions based on your comments."
        ]
        
        return responses.randomElement() ?? "AI response generated!"
    }
}

/// Feature row component for displaying app capabilities
struct FeatureRow: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    ContentView()
}
