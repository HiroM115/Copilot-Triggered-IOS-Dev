import Foundation

/// Core utilities for AI-Driven iOS Development
/// This module provides platform-independent utilities that can be tested on any platform
public struct AIDrivenUtilities {
    
    /// Validates an email address format
    /// - Parameter email: The email address to validate
    /// - Returns: True if the email format is valid
    public static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    /// Formats a date to a human-readable string
    /// - Parameter date: The date to format
    /// - Returns: Formatted date string
    public static func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    /// Generates a unique identifier
    /// - Returns: A UUID string
    public static func generateUUID() -> String {
        return UUID().uuidString
    }
}
