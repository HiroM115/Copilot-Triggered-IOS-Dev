import SwiftUI

/// The main content view showcasing AI-driven development features
struct ContentView: View {
    @State private var showAssistant = false
    @State private var emailInput = ""
    @State private var emailValidationResult = ""
    @State private var selectedDate = Date()
    @State private var generatedUUID = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header Section
                    VStack(spacing: 8) {
                        Image(systemName: "brain.head.profile")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                        
                        Text("AI-Driven Development")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Powered by GitHub Copilot")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 20)
                    
                    // Email Validation Demo
                    GroupBox(label: Label("Email Validation", systemImage: "envelope")) {
                        VStack(alignment: .leading, spacing: 12) {
                            TextField("Enter email address", text: $emailInput)
                                .textFieldStyle(.roundedBorder)
                                #if os(iOS)
                                .textInputAutocapitalization(.never)
                                .keyboardType(.emailAddress)
                                #endif
                            
                            Button(action: validateEmail) {
                                Label("Validate", systemImage: "checkmark.circle")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.borderedProminent)
                            
                            if !emailValidationResult.isEmpty {
                                Text(emailValidationResult)
                                    .font(.caption)
                                    .foregroundColor(emailValidationResult.contains("Valid") ? .green : .red)
                                    .padding(.top, 4)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    
                    // Date Formatting Demo
                    GroupBox(label: Label("Date Formatting", systemImage: "calendar")) {
                        VStack(alignment: .leading, spacing: 12) {
                            DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("Formatted:")
                                        .fontWeight(.medium)
                                    Spacer()
                                    Text(AIDrivenUtilities.formatDate(selectedDate))
                                        .foregroundColor(.secondary)
                                }
                                
                                HStack {
                                    Text("Relative:")
                                        .fontWeight(.medium)
                                    Spacer()
                                    Text(AIDrivenUtilities.formatRelativeTime(selectedDate))
                                        .foregroundColor(.secondary)
                                }
                            }
                            .font(.caption)
                        }
                        .padding(.vertical, 8)
                    }
                    
                    // UUID Generation Demo
                    GroupBox(label: Label("UUID Generator", systemImage: "number")) {
                        VStack(alignment: .leading, spacing: 12) {
                            Button(action: generateUUID) {
                                Label("Generate UUID", systemImage: "arrow.clockwise")
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(.bordered)
                            
                            if !generatedUUID.isEmpty {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Generated UUID:")
                                        .font(.caption)
                                        .fontWeight(.medium)
                                    Text(generatedUUID)
                                        .font(.system(.caption, design: .monospaced))
                                        .foregroundColor(.secondary)
                                        .textSelection(.enabled)
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    
                    // AI Assistant Button
                    Button(action: { showAssistant = true }) {
                        Label("Launch AI Assistant", systemImage: "message.fill")
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .padding(.top, 8)
                }
                .padding()
            }
            .navigationTitle("AI Demo")
            .sheet(isPresented: $showAssistant) {
                AIAssistantView()
            }
        }
    }
    
    // MARK: - Actions
    
    private func validateEmail() {
        let isValid = AIDrivenUtilities.isValidEmail(emailInput)
        emailValidationResult = isValid ? "✓ Valid email address" : "✗ Invalid email address"
    }
    
    private func generateUUID() {
        generatedUUID = AIDrivenUtilities.generateUUID()
    }
}

#Preview {
    ContentView()
}
