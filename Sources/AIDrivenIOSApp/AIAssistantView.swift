import SwiftUI

/// A reusable AI assistant component that demonstrates GitHub Copilot Pro usage
/// This component can be used to showcase AI-driven features in your iOS app
struct AIAssistantView: View {
    @State private var messages: [ChatMessage] = []
    @State private var inputText: String = ""
    @State private var isThinking: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            headerView
            
            Divider()
            
            // Messages List
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(messages) { message in
                            MessageBubble(message: message)
                                .id(message.id)
                        }
                        
                        if isThinking {
                            ThinkingIndicator()
                        }
                    }
                    .padding()
                }
                .onChange(of: messages.count) { _ in
                    if let lastMessage = messages.last {
                        withAnimation {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
            }
            
            Divider()
            
            // Input Area
            inputArea
        }
        .navigationTitle("AI Assistant")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var headerView: some View {
        HStack {
            Image(systemName: "brain.head.profile")
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text("AI Assistant")
                    .font(.headline)
                Text("Powered by Copilot")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Circle()
                .fill(Color.green)
                .frame(width: 8, height: 8)
        }
        .padding()
        .background(Color(.systemGray6))
    }
    
    private var inputArea: some View {
        HStack(spacing: 12) {
            TextField("Ask me anything...", text: $inputText, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(1...4)
            
            Button(action: sendMessage) {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 32))
                    .foregroundColor(inputText.isEmpty ? .gray : .blue)
            }
            .disabled(inputText.isEmpty || isThinking)
        }
        .padding()
        .background(Color(.systemBackground))
    }
    
    private func sendMessage() {
        guard !inputText.isEmpty else { return }
        
        let userMessage = ChatMessage(text: inputText, isUser: true)
        messages.append(userMessage)
        
        let question = inputText
        inputText = ""
        isThinking = true
        
        // Simulate AI response
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let response = generateAIResponse(for: question)
            let aiMessage = ChatMessage(text: response, isUser: false)
            
            withAnimation {
                messages.append(aiMessage)
                isThinking = false
            }
        }
    }
    
    private func generateAIResponse(for question: String) -> String {
        // This is a placeholder. In production, integrate with actual AI service
        let responses = [
            "GitHub Copilot Pro helps you write better Swift code with intelligent suggestions.",
            "SwiftUI makes it easy to build beautiful iOS apps with declarative syntax.",
            "Use async/await for modern asynchronous programming in Swift.",
            "SF Symbols provides thousands of icons optimized for iOS.",
            "Combine framework enables reactive programming in Swift."
        ]
        
        return responses.randomElement() ?? "I'm here to help with your iOS development!"
    }
}

/// Model for chat messages
struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
    let timestamp = Date()
}

/// Message bubble component
struct MessageBubble: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
            }
            
            VStack(alignment: message.isUser ? .trailing : .leading, spacing: 4) {
                Text(message.text)
                    .padding(12)
                    .background(message.isUser ? Color.blue : Color(.systemGray5))
                    .foregroundColor(message.isUser ? .white : .primary)
                    .cornerRadius(16)
                
                Text(message.timestamp, style: .time)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: 280, alignment: message.isUser ? .trailing : .leading)
            
            if !message.isUser {
                Spacer()
            }
        }
    }
}

/// Thinking indicator animation
struct ThinkingIndicator: View {
    @State private var animationPhase = 0
    @State private var timer: Timer?
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { index in
                Circle()
                    .fill(Color.gray)
                    .frame(width: 8, height: 8)
                    .opacity(animationPhase == index ? 1.0 : 0.3)
            }
        }
        .padding(12)
        .background(Color(.systemGray5))
        .cornerRadius(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear {
            startAnimation()
        }
        .onDisappear {
            stopAnimation()
        }
    }
    
    private func startAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
            withAnimation {
                animationPhase = (animationPhase + 1) % 3
            }
        }
    }
    
    private func stopAnimation() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    NavigationStack {
        AIAssistantView()
    }
}
