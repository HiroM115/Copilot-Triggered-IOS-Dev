import SwiftUI

/// AI Assistant Chat View with message bubbles and typing indicators
struct AIAssistantView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var messages: [ChatMessage] = []
    @State private var inputText = ""
    @State private var isThinking = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
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
                                    .id("thinking")
                            }
                        }
                        .padding()
                    }
                    .onChange(of: messages.count) { _ in
                        withAnimation {
                            if let lastMessage = messages.last {
                                proxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                    }
                    .onChange(of: isThinking) { thinking in
                        if thinking {
                            withAnimation {
                                proxy.scrollTo("thinking", anchor: .bottom)
                            }
                        }
                    }
                }
                
                Divider()
                
                // Input Area
                HStack(spacing: 12) {
                    TextField("Ask me anything...", text: $inputText, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(1...4)
                        .disabled(isThinking)
                    
                    Button(action: sendMessage) {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.title2)
                            .foregroundColor(inputText.isEmpty || isThinking ? .gray : .blue)
                    }
                    .disabled(inputText.isEmpty || isThinking)
                }
                .padding()
                .background(Color(.systemBackground))
            }
            .navigationTitle("AI Assistant")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .onAppear {
                // Welcome message
                if messages.isEmpty {
                    messages.append(ChatMessage(
                        content: "Hello! I'm your AI assistant. How can I help you today?",
                        isUser: false
                    ))
                }
            }
        }
    }
    
    // MARK: - Actions
    
    private func sendMessage() {
        guard !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        let userMessage = ChatMessage(content: inputText, isUser: true)
        messages.append(userMessage)
        
        let userInput = inputText
        inputText = ""
        
        // Simulate AI thinking
        isThinking = true
        
        // Simulate response delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isThinking = false
            let response = generateResponse(for: userInput)
            messages.append(ChatMessage(content: response, isUser: false))
        }
    }
    
    private func generateResponse(for input: String) -> String {
        let lowercased = input.lowercased()
        
        if lowercased.contains("hello") || lowercased.contains("hi") {
            return "Hello! How can I assist you with your development tasks today?"
        } else if lowercased.contains("copilot") {
            return "GitHub Copilot is an AI-powered code completion tool that helps developers write code faster. It's powered by OpenAI Codex and trained on billions of lines of public code."
        } else if lowercased.contains("swift") {
            return "Swift is a powerful and intuitive programming language for iOS, macOS, watchOS, and tvOS. It's designed to work with Apple's Cocoa and Cocoa Touch frameworks."
        } else if lowercased.contains("help") {
            return "I can help you with:\n• Code explanations\n• Best practices\n• SwiftUI guidance\n• GitHub Copilot tips\n\nWhat would you like to know?"
        } else if lowercased.contains("thank") {
            return "You're welcome! Feel free to ask if you need anything else."
        } else {
            return "That's an interesting question! In a real implementation, I would use an AI model to provide a more detailed response. For now, I'm demonstrating the chat UI with simulated responses."
        }
    }
}

// MARK: - Message Bubble

struct MessageBubble: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
            }
            
            VStack(alignment: message.isUser ? .trailing : .leading, spacing: 4) {
                Text(message.content)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(message.isUser ? Color.blue : Color(.systemGray5))
                    .foregroundColor(message.isUser ? .white : .primary)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                
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

// MARK: - Thinking Indicator

struct ThinkingIndicator: View {
    @State private var animationAmount = 0.0
    @State private var timer: Timer?
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<3) { index in
                Circle()
                    .fill(Color.gray)
                    .frame(width: 8, height: 8)
                    .scaleEffect(animationAmount == Double(index) ? 1.3 : 1.0)
                    .animation(
                        .easeInOut(duration: 0.6)
                        .repeatForever(autoreverses: true)
                        .delay(Double(index) * 0.2),
                        value: animationAmount
                    )
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear {
            startAnimation()
        }
        .onDisappear {
            stopAnimation()
        }
    }
    
    private func startAnimation() {
        animationAmount = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1.8, repeats: true) { _ in
            animationAmount = (animationAmount + 1).truncatingRemainder(dividingBy: 3)
        }
    }
    
    private func stopAnimation() {
        timer?.invalidate()
        timer = nil
    }
}

// MARK: - Chat Message Model

struct ChatMessage: Identifiable {
    let id = UUID()
    let content: String
    let isUser: Bool
    let timestamp = Date()
}

#Preview {
    AIAssistantView()
}
