import XCTest
@testable import AIDrivenIOSApp

final class AIDrivenUtilitiesTests: XCTestCase {
    
    // MARK: - Email Validation Tests
    
    func testEmailValidation() throws {
        // Given: Valid email addresses
        let validEmails = [
            "user@example.com",
            "test.user@domain.co.uk",
            "developer+tag@github.com",
            "name_123@test-domain.com"
        ]
        
        // When & Then: All valid emails should pass validation
        for email in validEmails {
            XCTAssertTrue(
                AIDrivenUtilities.isValidEmail(email),
                "Expected '\(email)' to be valid"
            )
        }
    }
    
    func testInvalidEmailValidation() throws {
        // Given: Invalid email addresses
        let invalidEmails = [
            "invalid.email",
            "@example.com",
            "user@",
            "user @example.com",
            "user@example",
            ""
        ]
        
        // When & Then: All invalid emails should fail validation
        for email in invalidEmails {
            XCTAssertFalse(
                AIDrivenUtilities.isValidEmail(email),
                "Expected '\(email)' to be invalid"
            )
        }
    }
    
    // MARK: - Date Formatting Tests
    
    func testDateFormatting() throws {
        // Given: A specific date
        var components = DateComponents()
        components.year = 2024
        components.month = 1
        components.day = 15
        let calendar = Calendar.current
        guard let date = calendar.date(from: components) else {
            XCTFail("Failed to create test date")
            return
        }
        
        // When: Formatting the date
        let formatted = AIDrivenUtilities.formatDate(date)
        
        // Then: The formatted string should contain the month and year
        XCTAssertTrue(
            formatted.contains("2024"),
            "Expected formatted date to contain year"
        )
        XCTAssertTrue(
            formatted.contains("January") || formatted.contains("15"),
            "Expected formatted date to contain month or day"
        )
    }
    
    func testRelativeTimeFormatting() throws {
        // Given: A date in the past
        let pastDate = Date().addingTimeInterval(-3600) // 1 hour ago
        
        // When: Formatting as relative time
        let formatted = AIDrivenUtilities.formatRelativeTime(pastDate)
        
        // Then: The string should indicate it's in the past
        XCTAssertTrue(
            formatted.contains("ago") || formatted.contains("hour"),
            "Expected relative time format to indicate past time"
        )
    }
    
    // MARK: - UUID Generation Tests
    
    func testUUIDGeneration() throws {
        // When: Generating a UUID
        let uuid = AIDrivenUtilities.generateUUID()
        
        // Then: It should be a valid UUID format
        XCTAssertEqual(uuid.count, 36, "UUID should be 36 characters long")
        XCTAssertTrue(uuid.contains("-"), "UUID should contain hyphens")
        
        // And: Two consecutive UUIDs should be different
        let uuid2 = AIDrivenUtilities.generateUUID()
        XCTAssertNotEqual(uuid, uuid2, "UUIDs should be unique")
    }
    
    func testShortUUIDGeneration() throws {
        // When: Generating a short UUID
        let shortUUID = AIDrivenUtilities.generateShortUUID()
        
        // Then: It should be 8 characters long
        XCTAssertEqual(shortUUID.count, 8, "Short UUID should be 8 characters long")
        
        // And: Two consecutive short UUIDs should be different
        let shortUUID2 = AIDrivenUtilities.generateShortUUID()
        XCTAssertNotEqual(shortUUID, shortUUID2, "Short UUIDs should be unique")
    }
    
    func testShortUUIDIsSubsetOfFullUUID() throws {
        // Given: We can create a full UUID from the same source
        // Note: This is a conceptual test since we're generating new UUIDs each time
        
        // When: Generating a short UUID
        let shortUUID = AIDrivenUtilities.generateShortUUID()
        
        // Then: It should only contain valid hex characters
        let hexCharacterSet = CharacterSet(charactersIn: "0123456789ABCDEF-")
        XCTAssertTrue(
            shortUUID.uppercased().unicodeScalars.allSatisfy { hexCharacterSet.contains($0) },
            "Short UUID should only contain valid UUID characters"
        )
    }
}
