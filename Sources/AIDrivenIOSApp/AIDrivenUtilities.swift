import Foundation

/// Platform-independent utilities for the AI-Driven iOS App
public struct AIDrivenUtilities {
    
    // MARK: - Email Validation
    
    /// Validates an email address using regex pattern
    /// - Parameter email: The email string to validate
    /// - Returns: true if the email is valid, false otherwise
    public static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    // MARK: - Date Formatting
    
    /// Formats a date to a localized string
    /// - Parameter date: The date to format
    /// - Returns: A formatted date string (e.g., "January 1, 2024")
    public static func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    /// Formats a date to a relative time string
    /// - Parameter date: The date to format
    /// - Returns: A relative time string (e.g., "2 hours ago")
    public static func formatRelativeTime(_ date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
    
    // MARK: - UUID Generation
    
    /// Generates a new UUID string
    /// - Returns: A UUID string
    public static func generateUUID() -> String {
        return UUID().uuidString
    }
    
    /// Generates a short UUID (first 8 characters)
    /// - Returns: A short UUID string
    public static func generateShortUUID() -> String {
        let fullUUID = UUID().uuidString
        return String(fullUUID.prefix(8))
    }
}
